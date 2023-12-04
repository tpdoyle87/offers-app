# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password username birthdate first_name last_name gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthdate, :gender, :email])

  end

  wrap_parameters false
end
