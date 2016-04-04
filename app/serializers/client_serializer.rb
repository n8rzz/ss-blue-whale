class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :fax, :phone, :email, :website
end
