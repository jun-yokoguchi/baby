class Seller < ActiveRecord::Base
  has_one :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
    mount_uploader :image, ImageUploader
end
