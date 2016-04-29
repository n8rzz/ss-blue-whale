class ClientContact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 160 }
end
