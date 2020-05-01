class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :omniauthable, :omniauth_providers => [:facebook]
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
 has_many :buildings

 def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end
def self.from_omniauth(auth)
  # Creates a new user only if it doesn't exist
  where(email: auth.info.email).first_or_initialize do |user|
    user.name = auth.info.name
    user.email = auth.info.email
  end
end
def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end
  
end
end
