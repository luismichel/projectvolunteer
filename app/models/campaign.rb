class Campaign < ActiveRecord::Base
  attr_accessible :date_event, :date_goal, :description, :economic_goal, :id_campaign, :id_category, :id_organization, :location, :man_power_goal, :name, :id_user

  belongs_to :organization
end
