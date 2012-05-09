class Product < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name, :message => "can't be blank"
  validates_length_of :name, :minimum => 2
end
