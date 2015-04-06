module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :email, :id
  end
end
