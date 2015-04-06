module V1
  class StoriesController < ApplicationController
    skip_before_action :authenticate_user_from_token, only: [:index, :show]

    def index
      @stories = Story.includes(:user).order(created_at: "desc").all
      render json: @stories, each_serializer: StoriesSerializer
    end

    def show
      @story = Story.find(params[:id])
      render json: @story, serializer: StorySerializer
    end

    def create
      @story = Story.new(story_params)

      if @story.save
        render json: @story, serializer: StorySerializer
      else
        render json: { success: false,
                       message: "Invalid parameters when creating a story." },
               status: :unprocessable_entity # 422
      end
    end

    private

    def story_params
      params.require(:story).permit(:title, :body).merge(user: current_user)
    end
  end
end
