class User < ActiveRecord::Base
  validates :name presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 30}
  validates :breed presence: true
  
  
  
  has_many :pets
end
