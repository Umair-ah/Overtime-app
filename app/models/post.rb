class Post < ApplicationRecord
    enum status: {submitted: 0, approved: 1, rejected: 2}
    belongs_to :user, optional: true
    validates :date, presence: true
    validates :rationale, presence: true
    validates :overtime_request, presence:true, numericality:{ greater_than: 0.0}

    scope :posts_by, ->(user) {where(user_id: user.id)}
end
