class RegistrationsController < Devise::RegistrationsController
   
protected

  def after_sign_up_path_for(resource)
    UserMailer.welcome_email(resource).deliver_now
    redirect_to "home#index"
  end
end
