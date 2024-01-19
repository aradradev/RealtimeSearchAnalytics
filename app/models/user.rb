# app/models/user.rb
class User < ApplicationRecord
  belongs_to :company
  has_many :search_events

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :company_id, case_sensitive: false }
end
