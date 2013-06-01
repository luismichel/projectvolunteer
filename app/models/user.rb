class User < ActiveRecord::Base
  attr_accessible :age, :bio, :email, :facebook_token, :gender, :id_user, :is_active, :name
  
  has_many :organizations
end
