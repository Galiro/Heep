class Collection < ActiveRecord::Base
  attr_accessible :description, :link, :name, :note, :photo
  has_many :rocks
  has_many :links
  has_many :notes
  belongs_to :user
end
