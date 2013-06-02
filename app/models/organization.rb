class Organization < ActiveRecord::Base
  attr_accessible :address_hq, :id_category, :id_organization, :id_user, :name, :phone_number, :register_date, :website_url, :description, :avatar

  belongs_to :user
  has_many :campaigns
  has_many :organizationmemberships, foreign_key: "user_id", dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100"}, :default_url => ":style/missing_org.png"
end
