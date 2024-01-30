class Search < ApplicationRecord
    include PgSearch::Model

    MIN_IP_LENGTH = 9
    MAX_IP_LENGTH = 13
    MAX_LENGTH = 255

    validates :ip_address, presence: true, length: { minimum: MIN_IP_LENGTH, maximum: MAX_IP_LENGTH }
    validates :query, presence: true, length: { minimum: 1, maximum: MAX_LENGTH }

    pg_search_scope :search,
        against: {
            query: 'A',
            ip_address: 'B'
        },
        using: {
            tsearch: { prefix: true }
        }
end
