module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token, only: [:create]

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, serializer: SessionSerializer, root: nil
      else
        render json: { success: false,
                       message: "Invalid parameters when creating a user." },
               status: :unprocessable_entity # 422
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
