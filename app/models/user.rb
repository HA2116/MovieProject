class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :image, allow_destroy: :true, reject_if: proc { |attributes| attributes['image'].blank? }

  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy

  def profile_picture(type)
    profile_pic = self.image
    profile_pic.present? ? profile_pic.image.url(type) : "thumb/missing.png"
  end
end
