class Link < ActiveRecord::Base
  attr_accessible :collection_id, :data, :url
  belongs_to :collection
end
