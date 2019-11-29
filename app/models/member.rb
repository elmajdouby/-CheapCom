class Member < ApplicationRecord
  belongs_to :type
  belongs_to :user

  def thumbnail
    return self.avatar.variant(reseize: '100*100').processed
  end
end
