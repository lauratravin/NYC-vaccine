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
    @locations = Location.all
    @users= User.all
    @appointments = Appointment.all

    erb :'admin'
  end

  #helpers

#  helpers do
    #find current user if the user logged in before
    # def current_user
    #   @current_user ||=  User.find_by_id(session[:user_id]) if session[:user_id]
    # end
   
    # def is_logged_in?
    #    !!current_user
    # end

    # def is_admin?
    #   binding.pry
    #        if current_user.level == "admin"
    #      return true     #this will work?    
    #   else
    #     return false 
    #   end  
    # end  
     
  # end
end
