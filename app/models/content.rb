class Content < ApplicationRecord
    MIN_LENGTH = 2
    MAX_LENGTH = 255

    validates :title, presence: true, length: { minimum: MIN_LENGTH, maximum: 20 }
    validates :body, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
end
