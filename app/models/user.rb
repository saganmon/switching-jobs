class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  VALID_EMAIL_ADDRESS = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 8 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_ADDRESS }
  # validates :password, :password_confirmation, presence: true

  before_save { self.email = email.downcase }

  has_many :conditions, dependent: :destroy

end
