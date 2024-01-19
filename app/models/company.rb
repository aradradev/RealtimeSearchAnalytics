class Company < ApplicationRecord
  has_many :users
  has_many :search_events, through: :users, class_name: 'SearchEvent'
end
