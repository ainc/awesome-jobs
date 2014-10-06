class ApplicationController < ActionController::Base

  # Devise param config
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def error_404
    respond_to do |format|
      format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def error_422
    respond_to do |format|
      format.html { render template: 'errors/error_422', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end

  def error_500
    respond_to do |format|
      format.html { render template: 'errors/error_500', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) << :login

      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :is_employer
      devise_parameter_sanitizer.for(:sign_up) << :username
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :company
      devise_parameter_sanitizer.for(:sign_up) << :website
      devise_parameter_sanitizer.for(:sign_up) << :address
      devise_parameter_sanitizer.for(:sign_up) << :phone
      devise_parameter_sanitizer.for(:sign_up) << :email

      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :description
      devise_parameter_sanitizer.for(:account_update) << :company
      devise_parameter_sanitizer.for(:account_update) << :website
      devise_parameter_sanitizer.for(:account_update) << :address
      devise_parameter_sanitizer.for(:account_update) << :phone
      devise_parameter_sanitizer.for(:account_update) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :remove_avatar
      devise_parameter_sanitizer.for(:account_update) << :username
      devise_parameter_sanitizer.for(:account_update) << :email

      if user_signed_in? and !current_user.is_employer
        devise_parameter_sanitizer.for(:account_update) << :resume
        devise_parameter_sanitizer.for(:account_update) << :remove_resume
      end
    end

end
