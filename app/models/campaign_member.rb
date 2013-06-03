class CampaignMember < ActiveRecord::Base
  attr_accessible :id_campaign, :id_user
  validates_uniqueness_of :id_user, :scope => :id_campaign

  has_many :users
end
