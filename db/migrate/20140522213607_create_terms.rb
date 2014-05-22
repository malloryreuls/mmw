class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.references :search, index: true

      t.timestamps
    end
  end
end
