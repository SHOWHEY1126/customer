class Customerlist < ActiveRecord::Base
  def full_name
    full_name = family_name + given_name
    full_name
  end
  
  belongs_to :company
  
  validates :family_name,
    presence: true, length: { maximum: 20}
  validates :given_name,
    presence: true, length: { maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true, format: { with: VALID_EMAIL_REGEX }
end