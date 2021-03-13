class Helper
    #find current user if the user logged in before
    def self.current_user(session)
      @current_user ||=  User.find_by_id(session[:user_id]) if session[:user_id]
    end
   
    def self.is_logged_in?(session)
       !!current_user(session)
    end

    def self.is_admin?(session)
          
           @user =  User.find_by_id(session[:user_id])
          
           if @user.level == "admin"
               return true     #this will work?    
           else
             return false
          end  
     
    end  

    def  self.age_is_ok?(session)
           @user =  User.find_by_id(session[:user_id])
           age = Date.today.year - @user.dob.year
           age -= 1 if  Date.today <  @user.dob + age.years
           if age <= 65
             return false
           else 
             return true 
           end
           
    end  
end    