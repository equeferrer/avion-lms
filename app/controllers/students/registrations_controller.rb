# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params
  before_action :configure_account_update_params

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name github_user batch_id])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name github_user])
  end
end
