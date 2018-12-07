class Product < ApplicationRecord
  belongs_to :user
  belongs_to :producttype
  has_many :productimage
  has_many :orders
  monetize :price_cents
end
