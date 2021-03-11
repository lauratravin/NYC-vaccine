
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
                @locations = Location.all
                erb :'appointments/create_appointment'
            else
                redirect  "/login"
            end        
  end

  post '/appointments' do
            if Helper.is_logged_in?(session)
            
                @appointment = Appointment.create(params[:appointment])
                @appointment.user = Helper.current_user(session)
                @appointment.save

                redirect :"appointments/#{@appointment.id}"

            else
                redirect  "/login"
            end       
  end

 #3-  show appointment. 

  get '/appointments/:id' do
            if Helper.is_logged_in?(session)
                @appointment = Appointment.find_by_id(params[:id])
                if Helper.current_user(session) == @appointment.user

                    erb :'/appointments/show_appointment'
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
        # binding.pry
        if Helper.is_logged_in?(session)
            @appointment= Appointment.find_by_id(params[:id])
            if @appointment && @appointment.user ==  Helper.current_user(session)
                
                @appointment.delete
                redirect  "/appointments"
            else
                redirect  "/login"
            end   
        else
            redirect  "/login"
        end    
    end 

end

