class ContactsController < ApplicationController
    def new # new is the name that matches with  " new " in contacts folder 
    
        @contact = Contact.new  # @contact is a variable 
        
    
    end    
    
    def create # this handle form submition  to get info from form
    
        @contact = Contact.new(contact_parameters)
    
        if @contact.save
            name = params[:contact][:name] # HASH syntax (params) assiginng info to variable
            email = params[:contact][:email] #assiginng info to variable
            body = params[:contact][:comments] #assiginng info to variable
            
            ContactMailer.contact_email(name,email,body).deliver # deliver email as long as form is successful,call ContactMailer function in contact_emailer.html.erb
                                                                # passing variables that we jus made above
            
            flash[:success] = 'Message Sent!' # success is a key that will be sent to flassh message in application.html.erb
            redirect_to new_contact_path # if successfull sent redirect back to form page with "message sent"
        else
            flash[:danger] = 'Error,Message not saved' # error is a key that will be sent to flassh message in application.html.erb
            redirect_to new_contact_path # if successfull sent redirect back to form page with " ERROR"
        
        end    
    end
    
    private
        def contact_parameters
            params.require(:contact).permit(:name,:email,:comments) #this is a security feature so people cant see in url line
        end
end    