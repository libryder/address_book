class User < ActiveRecord::Base
  has_many :addresses
  
  attr_accessible :first_name, :last_name
  
  validates_presence_of :first_name, :last_name
  
end
 