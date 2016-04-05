class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :state, :zip, :fax, :phone, :email, :website
end
