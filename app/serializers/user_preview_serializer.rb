class UserPreviewSerializer < ActiveModel::Serializer
  attributes :user_id, :email, :username

  def user_id
    object.id
  end
end
