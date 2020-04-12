class Pet < ActiveRecord::Base
  validates :pet_chipped, presence: true
  validates :pet_chip_id, presence: true, uniqueness: { numericality: true }
  has_one  :owner
end
