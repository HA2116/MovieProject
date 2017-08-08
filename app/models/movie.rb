class Movie < ActiveRecord::Base
  GENRES = ['comedy', 'horror', 'crime', 'action', 'drama', 'thriller', 'fantasy', 'animation']

  has_many :images, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  has_many :castings, dependent: :destroy
  has_many :actors, through: :castings

  scope :featured, -> { where(approved: true, featured: true) }
  scope :latest, -> { where(approved: true).order(release_date: :desc) }
  scope :top, -> { where(approved: true) }

end
