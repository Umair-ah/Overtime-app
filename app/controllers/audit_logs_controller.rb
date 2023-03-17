class AuditLogsController < ApplicationController
    def index
        @audit_logs = AuditLog.all.page(params[:page]).per(10)
        authorize @audit_logs
    end

    def confirm
        audit_log = AuditLog.find(params[:id])    
        authorize audit_log
        audit_log.confirmed!
        redirect_to root_path, notice:"Thank You, Your Confirmation is successfully made!"
    end
    
end
