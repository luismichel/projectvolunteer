class CampaignMember < ActiveRecord::Base
  attr_accessible :id_campaign, :id_user
  has_many :users
end
