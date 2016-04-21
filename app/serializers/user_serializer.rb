class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :email, :username, :access_token, :token_type

  def user_id
    object.id
  end

  def token_type
    'Bearer'
  end
end
