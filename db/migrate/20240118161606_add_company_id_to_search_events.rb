class AddCompanyIdToSearchEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :search_events, :company, null: false, foreign_key: true
  end
end
