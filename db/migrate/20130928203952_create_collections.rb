class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.string :link
      t.string :photo
      t.string :note
      
      t.timestamps
    end
  end
end
