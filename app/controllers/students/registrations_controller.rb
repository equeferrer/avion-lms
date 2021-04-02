# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  def create
    before_action :configure_sign_up_params
    super
  end

  def update
    before_action :configure_account_update_params
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name github_user])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name github_user])
  end
end
