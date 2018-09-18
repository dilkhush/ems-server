class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  has_many :employees


  def reset_authentication_token
    update(authentication_token: generate_access_token)
  end

  def logout
    update(authentication_token: nil)
  end

  private
    def generate_access_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end

end
