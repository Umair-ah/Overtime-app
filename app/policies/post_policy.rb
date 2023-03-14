class PostPolicy < ApplicationPolicy

    def update?
        return true if admin? && post_approved?
        return true if user_or_admin && !post_approved?
    end

    def approve?
        admin?
    end

    private
        def admin?
            admins_who_can_access.include?(user.type)
        end

        def user_or_admin
            record.user_id == user.id || admin? 
        end

        def post_approved?
            record.approved?
        end
end