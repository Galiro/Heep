class Collection < ActiveRecord::Base
  attr_accessible :description, :link, :name, :note, :photo
end
