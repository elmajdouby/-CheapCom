class Productimage < ApplicationRecord
  belongs_to :user
  belongs_to :product
  mount_uploader :photo, PhotoUploader
end
