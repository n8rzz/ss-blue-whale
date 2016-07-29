class ClientPreviewSerializer < ActiveModel::Serializer
  attributes(:id, :name, :address_1, :address_2,
             :city, :state, :zip, :fax, :phone,
             :email, :emailPrimary, :emailSecondary,
             :dbaName, :spouseName, :website, :entity,
             :joinDate, :status)
end
