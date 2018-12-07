class Product < ApplicationRecord
  belongs_to :user
  belongs_to :producttype

  has_many :orders
  monetize :price_cents

  has_many :productimages

end
