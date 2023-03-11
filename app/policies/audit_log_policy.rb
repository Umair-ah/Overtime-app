class AuditLogPolicy < ApplicationPolicy

    def index?
        return true if admin?
    end

    private
        def admin?
            admins_who_can_access.include?(user.type)
        end

end