class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  validates :username, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :access_token, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  private

  def update_access_token!
    self.access_token = "#{id}:#{Devise.friendly_token}"
    save
  end
end
