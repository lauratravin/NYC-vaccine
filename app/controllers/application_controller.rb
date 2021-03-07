require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vaccine_secret"
  end

  #home
  get '/' do
    erb :index
  end

  #helpers

 helpers do
    #find current user if the user logged in before
    def current_user
      @current_user ||=  User.find_by_id(session[:user_id]) if session[:user_id]
    end
   
    def is_logged_in?
       !!current_user
    end

    def is_admin?
      binding.pry
           if current_user.level == "admin"
         return true     #this will work?    
      else
        return false
      end  
    end  
     
  end
end
