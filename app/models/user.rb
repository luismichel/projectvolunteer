class User < ActiveRecord::Base
  attr_accessible :age, :bio, :email, :facebook_token, :gender, :id_user, :is_active, :name, :password, :password_confirmation

  has_many :organizations





 def self.from_omniauth(auth)
   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.name = auth.info.name
     user.oauth_token = auth.credentials.token
     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
     user.profile_pic = auth.info.image
     user.email = auth.info.email
     user.save!
   end
 end

end
