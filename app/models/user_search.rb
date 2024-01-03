class UserSearch < ApplicationRecord
    validates :query, presence: true, uniqueness: true

    scope :unique_queries, -> { select(:query).distinct}
end
