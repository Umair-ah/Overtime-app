class Post < ApplicationRecord
    enum status: {submitted: 0, approved: 1, rejected: 2}
    belongs_to :user, optional: true
    validates :date, presence: true
    validates :rationale, presence: true
end
