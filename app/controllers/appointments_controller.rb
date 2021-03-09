class AppointmentsController < ApplicationController

#1-only user's appointment


 get '/appointments' do
    
    if Helper.is_logged_in?(session)
        binding.pry
       @appointments = Appointment.find_by(:user_id => session[user_id])
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
        binding.pry
        @appointment.locations = Location.find_by_id(params[:id])
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







end

