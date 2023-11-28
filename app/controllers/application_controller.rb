# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name birthdate gender])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name birthdate gender])
  end

  def after_sign_in_path_for(_resource)
    offers_index_path  # Assuming you have an offers route set up
  end

  def after_sign_up_path_for(_resource)
    offers_index_path  # Redirection path after signup
  end

  def after_sign_out_path_for(_resource_or_scope)
    home_index_path  # Redirection path after signout
  end
end