class CreateSearchCounts < ActiveRecord::Migration
  def change
    create_table :search_counts do |t|
      t.string :query
      t.integer :count
      t.datetime :most_recent

      t.timestamps
    end
  end
end
