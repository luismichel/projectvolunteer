class Campaign < ActiveRecord::Base
  attr_accessible :date_event, :date_goal, :description, :economic_goal, :id_campaign, :id_category, :id_organization, :location, :man_power_goal, :name, :id_user, :avatar

  belongs_to :organization
  has_attached_file :avatar, :styles => { :normal => "780x400", :small => "390x200", :thumb => "180x100"}, :default_url => ":style/missing_cover.png"
end
