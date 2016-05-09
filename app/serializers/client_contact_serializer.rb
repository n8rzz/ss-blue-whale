class ClientContactSerializer < ActiveModel::Serializer
  attributes :id, :position, :name, :businessPhone, :mobilePhone, :email, :client_id
end
