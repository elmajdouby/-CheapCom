class Payment < ApplicationRecord
  belongs_to :subscription
  belongs_to :type
  belongs_to :user
end
