class ApplicationController < ActionController::Base
  # This is for devise gem
  before_action :authenticate_user!
  # This is for pundit gem
  include Pundit::Authorization

  # The below is for pundit gem - tells you if you have forgotten to authorize a controller action or not scoped index page
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  #This lets you add custom fields to the Devise sign up form
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #This lets you add custom fields to the Devise sign up form
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :job_title, :company])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :job_title, :company])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
