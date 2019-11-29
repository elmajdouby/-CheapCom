class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # ,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable, :trackable, :timeoutable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  # def thumbnail
  #   self.avatar.variant(reseize: '100*100').processed.service_url
  # end
  # def set_filename
  #   if self.avatar.attached?
  #     self.avatar.blob.update(filename: self.username + ".#{self.avatar.filename.extension}")
  #   end
  # end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
