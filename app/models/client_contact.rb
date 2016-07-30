class ClientContact < ApplicationRecord
  belongs_to :client, inverse_of: :client_contacts

  validates :name, presence: true, length: { minimum: 2, maximum: 160 }
end
