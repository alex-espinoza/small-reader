module V1
  class StorySerializer < ActiveModel::Serializer
    attributes :title, :body, :id, :created_at

    has_one :user, serializer: UserSerializer
  end
end
