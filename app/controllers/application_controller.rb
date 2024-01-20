class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to projects_path
    end
    
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :usertype])
    end

 

end
