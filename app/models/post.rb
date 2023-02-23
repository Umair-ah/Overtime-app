class Post < ApplicationRecord
    belongs_to :user, optional: true
    validates :date, presence: true
    validates :rationale, presence: true
end
