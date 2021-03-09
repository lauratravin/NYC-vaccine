class LocationsController < ApplicationController
#note: locations can only be create, update or delete by the admin.






#2-create locations only admin
 get '/locations/new' do
    if Helper.is_logged_in?(session)
        if Helper.is_admin?(session)  
            erb :'locations/create_location'
        else
            redirect  "/login"
        end   
    else
        redirect  "/login"
    end    
 end

post  '/locations' do
    if Helper.is_logged_in?(session)
        if Helper.is_admin?(session)  
            if params[:name].empty? || params[:address].empty?
               
                redirect  "/locations/new"
            else    
                @location = Location.create(:name => params[:name], :address => params[:address])
                redirect "/admin"
            end
        else
            redirect  "/login"
        end   
    else
        redirect  "/login"
    end    
 end

#3-update locations only admin

get '/locations/:id/edit' do
    
    if Helper.is_logged_in?(session)
        if Helper.is_admin?(session)  
            @location= Location.find_by_id(params[:id])

            erb :'locations/edit_location'
        else
            redirect  "/login"
        end   
    else
        redirect  "/login"
    end    

end

patch '/locations/:id' do
    if Helper.is_logged_in?(session)
        if Helper.is_admin?(session)  
            if params[:name].empty? || params[:addess].empty?
                redirect "/locations/${params[:id]}"
            else
                @location= Location.find_by_id(params[:id])
                if @location.update(:name => params[:name],
                    :address=> params[:address])
                    redirect "/admin"
                else
                    redirect "/locations/${params[:id]}"
                end        
            end    


        else
            redirect  "/login"
        end   
    else
        redirect  "/login"
    end    

end

#4-delete location only admin

delete '/locations/:id/delete' do
    if Helper.is_logged_in?(session)
        if Helper.is_admin?(session)  
            @location= Location.find_by_id(params[:id])
            @location.delete
            redirect  "/admin"
        else
            redirect  "/login"
        end   
    else
        redirect  "/login"
    end    
end 



end