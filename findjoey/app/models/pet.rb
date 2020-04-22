class Pet < ActiveRecord::Base
  belongs_to :user
  has_one :owner
  validates :pet_chipped, presence: true
  validates :pet_chip_id, presence: true, uniqueness: true, numericality: true
  validates :pet_temperament, presence: true
  validates :weight, presence: true, numericality: true
end
