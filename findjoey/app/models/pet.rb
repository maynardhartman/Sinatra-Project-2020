class Pet < ActiveRecord::Base
  belongs_to :user
  has_one :owner
  validates :chipped, presence: true
  validates :chip_id, presence: true, uniqueness: true, numericality: true
  validates :temperament, presence: true
  validates :weight, presence: true, numericality: true
end
