class UsersController < ApplicationController

#routes
#1-get user by slug
   get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'users/show_user'  
   end 

#2-sign up a new user into the portal
   get '/signup' do
       if Helper.is_logged_in?(session)
         redirect "/appointments"
       else 
         erb :'/users/create_user' 
       end 
   end    
   
   post '/signup' do
      #form has required field, but just in case double check params fields
      if params[:fullname].empty? ||
         params[:address].empty? ||
         params[:state].empty? ||
         params[:email].empty? ||
         params[:dob].empty? ||
         params[:username].empty? ||
         params[:password].empty? 
         flash[:message] = "Please complete all the fields."
         redirect "/signup"
      else
        @user = User.create(
            :fullname => params[:fullname],
            :address => params[:address],
            :state => params[:state],
            :email => params[:email],
            :dob =>  params[:dob],
            :username => params[:username],
            :password => params[:password],
            # :level => "admin" used only first time for creating admin user
            :level => "user"
        )
        session[:user_id]=@user.id
        redirect '/appointments'
      end    


   end  

#3-login for existing user
    get '/login' do
       
        if Helper.is_logged_in?(session)
            if Helper.is_admin?(session)
                redirect "/admin"
            else    
                redirect "/appointments"
            end    
        else
            erb :'users/login'
        end

    end    

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            if Helper.is_admin?(session)
                redirect "/admin"  
            else    
              redirect "/appointments"
            end  
        else
            flash[:message] = "Wrong password or username" 
            redirect "/signup"
        end        
    end  
 
 #4-logout current user
    get '/logout' do
        if Helper.is_logged_in?(session)
            session.destroy
            redirect  "/"
        else
            redirect  "/login"
        end

    end       
#5-edit current user
  
    get '/users/:id/edit' do
        if Helper.is_logged_in?(session)
            
            @user = User.find_by_id(params[:id])
            erb  :'users/edit_user'
        else
            flash[:message] = "This user does not belong to you or you are not logged in." 
            redirect  "/login"
        end

    end   
    
    patch '/users/:id/edit' do
        if Helper.is_logged_in?(session)
            @user = Helper.current_user(session)
            if params[:fullname].empty? || params[:address].empty? || params[:dob].empty? || params[:email].empty?
                redirect "/users/#{@user.id}/edit"
            else
                @user.update(:fullname => params[:fullname],:address => params[:address], :dob => params[:dob], :email => params[:email])
                redirect "/users/#{@user.username}"
            end    
           
        else
            redirect  "/login"
        end

    end   

end    