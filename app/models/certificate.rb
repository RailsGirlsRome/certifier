class Certificate < ActiveRecord::Base
  attr_accessible :email, :name

  validates_presence_of :email, :name
end
