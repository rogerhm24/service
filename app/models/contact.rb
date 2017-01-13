class Contact <ActiveRecord::Base
    
    validates :name,presence: true  # checks to see if the name field is validated 
    validates :email,presence: true # checks to see if the email field is validated 

end