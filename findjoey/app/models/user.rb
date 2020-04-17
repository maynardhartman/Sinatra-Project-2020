class User < ActiveRecord::Base
  validates :name presence: true
  validates :breed presence: true
  has_many :pets
end
