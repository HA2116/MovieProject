class Actor < ActiveRecord::Base
  GENDERS = %w(male female)

  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }, inclusion: { in: GENDERS }

  has_many :castings, dependent: :destroy
  has_many :movies, through: :castings
end
