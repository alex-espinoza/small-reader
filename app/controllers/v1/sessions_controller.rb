module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token

    def create
      @user = User.find_for_database_authentication(email: params[:email])
      return invalid_login_attempt if !@user

      if @user.valid_password?(params[:password])
        sign_in(:user, @user)
        render json: @user, serializer: SessionSerializer, root: nil
      else
        invalid_login_attempt
      end
    end

    private

    def invalid_login_attempt
      warden.custom_failure!
      render json: { success: false,
                     message: "Invalid credentials." },
             status: :unprocessable_entity # 422
    end
  end
end
