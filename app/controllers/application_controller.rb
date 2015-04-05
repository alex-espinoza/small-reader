class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token

  respond_to :json

  def authenticate_user_from_token
    auth_token = request.headers["Authorization"]

    if auth_token
      authenticate_with_token(auth_token)
    else
      authentication_error
    end
  end

  private

  def authenticate_with_token(token)
    user = User.find_by(authentication_token: token)

    if user && Devise.secure_compare(user.authentication_token, token)
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    return render json: { success: false,
                    message: "Invalid authentication token"},
                  status: 401
  end
end
