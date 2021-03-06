class ApplicationController < ActionController::Base

   before_action :authenticate_user!, except: [:top]
   before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # pp "configure_permitted_parameters", devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:encrypted_password, :email])
  end



  def after_sign_out_path_for(resource_or_scope)
    pp "application", resource_or_scope
    if resource_or_scope == :user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

end
