class ClientContact < ApplicationRecord
  belongs_to :client

  validates :name, presence: true, length: { minimum: 2, maximum: 160 }
end
