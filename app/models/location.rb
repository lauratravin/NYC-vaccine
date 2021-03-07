class Location < ActiveRecord::Base
    has_many :appointment_locations
    has_many :appointments, through: :appointment_locations

     def slug
        username.downcase.gsub(' ', '-')
      end
    
      def self.find_by_slug(slug)
        User.all.find { |u| u.slug == slug }
      end 


end  