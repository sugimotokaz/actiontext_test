class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
end
