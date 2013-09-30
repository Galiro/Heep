class RemoveCollectionCrap < ActiveRecord::Migration
  def change
    remove_column :collections, :link
    remove_column :collections, :photo
    remove_column :collections, :note
  end
end
