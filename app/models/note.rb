class Note < ActiveRecord::Base
  attr_accessible :collection_id, :content, :name

  belongs_to :collection
end
