class SearchEvent < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  belongs_to :company, foreign_key: 'company_id'

  pg_search_scope :search, against: { query: 'A' }, using: { tsearch: { prefix: true } }

  validates :query, presence: true, length: { in: 1..255 }

  before_create :set_searched_at

  def self.full_text_search(query)
    pg_search(query)
  end

  def self.search_analytics(period)
    start_time = (Time.current - period).beginning_of_day
    where('created_at >= ?', start_time)
      .group(:query)
      .select('query, COUNT(*) as searches_count')
      .order('searches_count DESC')
  end

  def self.user_analytics(user_id, period)
    start_time = (Time.current - period).beginning_of_day
    where('user_id = ? AND created_at >= ?', user_id, start_time)
      .group(:query)
      .select('query, COUNT(*) as searches_count')
      .order('searches_count DESC')
  end

  private

  def set_searched_at
    self.searched_at = Time.current
  end
end
