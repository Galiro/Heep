class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :data
      t.integer :collection_id

      t.timestamps
    end
  end
end
