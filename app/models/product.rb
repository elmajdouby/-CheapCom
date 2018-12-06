class Product < ApplicationRecord
  belongs_to :user
  belongs_to :producttype
  has_many :productimage
end
