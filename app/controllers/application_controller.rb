class ApplicationController < ActionController::API
  include AbstractController::Translation

  before_action :authenticate_user_from_token!

  after_action :cors_set_access_control_headers

  respond_to :json

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin']      = '*'
    headers['Access-Control-Allow-Methods']     = 'POST, GET, PUT, PATCH, OPTIONS'
    headers['Access-Control-Max-Age']           = '1728000'
    headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def default_serializer_options
    { root: false }
  end

  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    if auth_token && auth_token.include?(':')
      authenticate_with_token(auth_token)
    else
      authentication_error
    end
  end

  private

  def authenticate_with_token(auth_token)
    user_id = auth_token.split(':').first
    user = User.where(id: user_id).first

    if user && Devise.secure_compare(user.access_token, auth_token)
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error(message = 'unauthorized')
    render json: { error: message, status: 401 }
  end
end
