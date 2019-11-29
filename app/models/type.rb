class Type < ApplicationRecord
  has_many :users
  has_many :payments
  has_many :members
end
