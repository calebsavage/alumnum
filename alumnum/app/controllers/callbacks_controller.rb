class CallbacksController < Devise::OmniauthCallbacksController
    def linkedin
    	# raise request.env["omniauth.auth"].to_json
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
        	sign_in_and_redirect @user
      	else
      		# session["devise.user_attributes"] = @user.attributes 
      		redirect_to new_user_registration_url
      	end
    end
end