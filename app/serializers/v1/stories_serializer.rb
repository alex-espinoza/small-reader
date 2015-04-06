module V1
  class StoriesSerializer < ActiveModel::Serializer
    attributes :title, :body, :id, :created_at

    has_one :user, serializer: UserSerializer

    def body
      object.body[0..200]
    end
  end
end
