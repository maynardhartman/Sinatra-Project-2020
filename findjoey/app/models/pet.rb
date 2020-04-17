class Pet < ActiveRecord::Base
  validates :pet_chipped, presence: true
  validates :pet_chip_id, presence: true, uniqueness: true, numericality: true
  has_one :owner
  belongs_to :user
end
