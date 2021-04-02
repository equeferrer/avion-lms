class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Student then student_dashboard_path
    when Admin then admin_dashboard_path
    end
  end
end
