class CreateSearchTerms < ActiveRecord::Migration
  def change
    create_table :search_terms do |t|
      t.references :search, index: true
      t.references :term, index: true

      t.timestamps
    end
  end
end
