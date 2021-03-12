
class AppointmentsController < ApplicationController

#1-only user's appointment


 get '/appointments' do
    
    if Helper.is_logged_in?(session)
                   
                #show only user appointments          
                @appointments = Helper.current_user(session).appointments
                erb :'/appointments/appointments'
    else
                 redirect  "/login"
    end       
end    



 #2-create appointment. 

  get '/appointments/new' do
            if Helper.is_logged_in?(session)
              
                if Appointment.where(:user_id => session[:user_id]).count >= 2
                    flash[:message] = "You have already two appointments."

                    redirect "/appointments"
                else   
                        @locations = Location.all
                        erb :'appointments/create_appointment'
                end        
            else
                redirect  "/login"
            end        
  end

  post '/appointments' do
   
            if Helper.is_logged_in?(session)
               
                       duplicate =  false
                        Appointment.where(:date => params[:appointment][:date]).each do |z|
                         
                            if z.time.strftime("%H:%M") == params[:appointment][:time] && z.location_id.to_s == params[:appointment][:location_id]
                              duplicate = true
                            end    
                        end
                
                        if duplicate 
                            flash[:message] = "This location and time is busy. Choose another time or location."
                            redirect  "/appointments"
                        else    
                            @appointment = Appointment.create(params[:appointment])
                            @appointment.user = Helper.current_user(session)
                            @appointment.save
                          
                            flash[:message] = "Appointment created."
                           
                            redirect  "/appointments/#{@appointment.id}"
                        end    
                 
            else
                redirect  "/login"
            end       
  end

 #3-  show appointment. 

  get '/appointments/:id' do
            if Helper.is_logged_in?(session)
                @appointment = Appointment.find_by_id(params[:id])
                if Helper.current_user(session) == @appointment.user

                    erb :'appointments/show_appointment'
                else
                    redirect  "/login"
                end    
            else
                redirect  "/login"
            end  
  end

  #4 edit appointments
  get '/appointments/:id/edit' do
         if Helper.is_logged_in?(session)
            @locations=Location.all
            @appointment= Appointment.find_by_id(params[:id])
            if @appointment && @appointment.user ==  Helper.current_user(session)
                   erb :'appointments/edit_appointment'   
            else
               redirect "/appointments"
            end 
        else
            redirect  "/login"
        end        
  end 

  patch '/appointments/:id' do
            if Helper.is_logged_in?(session)
                @appointment= Appointment.find_by_id(params[:id])
                if params[:location_id].empty? || params[:date].empty? || params[:time].empty? || params[:dose].empty? 
                   flash[:message] = "Some field is empty."
                   redirect  "/appointments/#{@appointment.id}/edit"
                   
                else
                    @appointment.update(:location_id => params[:location_id],:date => params[:date], :time => params[:time],:dose => params[:dose] )
                    redirect  "/appointments"
                end
            else
                redirect  "/login"
        end  
  end 

  #5-delete appointment

    delete '/appointments/:id' do
     
        if Helper.is_logged_in?(session)
            @appointment= Appointment.find_by_id(params[:id])
            if @appointment && @appointment.user ==  Helper.current_user(session)
                
                @appointment.delete
                flash[:message] = "Your appointment has been deleted."

                redirect  "/appointments"
            else
                redirect  "/login"
            end   
        else
            redirect  "/login"
        end    
    end 

end

