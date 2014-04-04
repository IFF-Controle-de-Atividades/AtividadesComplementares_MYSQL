class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  #before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) {|may| may.permit(:password, :password_confirmation, :current_password) }
  # end
end
