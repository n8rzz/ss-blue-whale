class ClientSerializer < ActiveModel::Serializer
  attributes(:id, :name, :address_1, :address_2,
             :city, :state, :zip, :fax, :phone,
             :email, :website, :entity, :joinDate,
             :status)

  has_many :client_contacts
  has_many :projects
  has_many :notes
end
