module UsersHelper
    
    def job_title_icon
        if @user.profile.job_title == "Developer"
        "<i class='fa fa-code'></1>".html_safe  
        end    
    end 
end    