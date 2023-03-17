class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def admins_who_can_access
        ["AdminUser"]
    end

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_back(fallback_location: root_path)
    end
end
