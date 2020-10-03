class ApplicationController < ActionController::Base
  before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :photo])

    # # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def show_navbar
    @show_navbar = true
  end
end
