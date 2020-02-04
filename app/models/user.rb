class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  valid_address = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: valid_address }, uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }

  has_many :conditions

end
