class Pet < ActiveRecord::Base
  validates :pet_chipped, presence: true # uniqueness: { case_insensitive: true }
  validates :pet_chip_id, presence: true, uniqueness: { numericality: true }
end
