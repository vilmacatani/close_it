class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company_name, :user_type, :address, :city, :country])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company_name, :user_type, :address, :city, :country])
  end

  # BLUE_PAGES = current_page?(root_path)
end
