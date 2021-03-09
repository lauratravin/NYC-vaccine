class AppointmentsController < ApplicationController

#1-only user's appointment


 get '/appointments' do
    
    if Helper.is_logged_in?(session)
    #    @appointments = Appointment.find_by(session[user_id])
       erb :'/appointments/appointments'
    else
        redirect  "/login"
    end       

 end   

 #1-create appointment. Need to create locations first.

  get '/appointments/new' do
    if Helper.is_logged_in?(session)
        erb :'appointments/create_appointment'
    else
        redirect  "/login"
    end       
  end


  post '/appointments/' do
    
  end

end