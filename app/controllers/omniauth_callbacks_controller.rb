class OmniauthCallbacksController < Devise::OmniauthCallbacksController   


	def facebook
	  auth = env["omniauth.auth"]
	  #@user = User.find_for_facebook(request.env["omniauth.auth"], current_user)
	  @user = User.find_for_social(request.env["omniauth.auth"], current_user)
	 		if @user.persisted?
	      flash[:notice] =  "devise.omniauth_callbacks.success"
	      sign_in_and_redirect @user, :event => :authentication
		  else
	      session["devise.facebook_data"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
	    end
	end
	

	def google_oauth2
    auth = env["omniauth.auth"] 
    #@user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
 		@user = User.find_for_social(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] =  "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def twitter
  	debugger
    auth = env["omniauth.auth"]
		@user = User.find_for_social(request.env["omniauth.auth"], current_user)
    #@user = User.find_for_twitter_oauth(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def linkedin
    auth = env["omniauth.auth"]
    @user = User.find_for_social(request.env["omniauth.auth"], current_user)
    #@user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end