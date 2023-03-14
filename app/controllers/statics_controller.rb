class StaticsController < ApplicationController
    def home
        @pending_approvals = Post.where(status: "submitted")
        @recent_audit_logs = AuditLog.last(10)
    end
end