require './config/environment'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vaccine_secret"
    register Sinatra::Flash
  end

  #home
  get '/' do
    erb :'index'
  end

  get '/admin' do
    if Helper.is_admin?(session)  
        @locations = Location.all
        @users= User.all
      

        erb :'admin'
    else
       erb :'index'
    end    
  end


  get '/admin-app' do
    if Helper.is_admin?(session)  
        
        @appointments = Appointment.all
        
        erb :'admin-app'
    else
       erb :'index'
    end    
  end

end
