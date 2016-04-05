class Client < ApplicationRecord
  has_many :projects, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
end
