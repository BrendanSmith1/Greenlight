class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  #This lets you add custom fields to the Devise sign up form
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :job_title, :company])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :job_title, :company])
  end
end
