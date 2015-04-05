class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable

  before_save :ensure_authentication_token

  validates_presence_of :email, :password, :authentication_token

  private

  def ensure_authentication_token
    if self.authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = SecureRandom.hex.to_s
      break token unless User.find_by(authentication_token: token)
    end
  end
end
