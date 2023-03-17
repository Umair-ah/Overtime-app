class StaticsController < ApplicationController

    def home
        if admins_who_can_access.include?(current_user.type)
            @pending_approvals = Post.submitted
            @recent_audit_logs = AuditLog.last(10)
        else
            #something
        end
    end
end