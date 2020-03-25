module ApplicationHelper
    def loginBar style
        if current_user.is_a?(GuestUser)
             (link_to "Register", new_user_registration_path, class: style) +
             (link_to "Login", new_user_session_path, class: style) 
            else
             link_to "logout", destroy_user_session_path, method: :delete, class: style 
            end
        end
            def sourceHelper
                 if session[:source]
                    greeting = "Thanks for visting me from #{session[:source]}"
                    content_tag(:p, greeting, class:"source-greeting")
                    end
                
                    
    end
end
