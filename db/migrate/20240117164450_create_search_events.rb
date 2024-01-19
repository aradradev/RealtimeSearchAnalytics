class CreateSearchEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :search_events do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true
      t.datetime :searched_at

      t.timestamps
    end
  end
end
