class OrganizationMemberships < ActiveRecord::Base
  attr_accessible :organization_id, :user_id

  belongs_to :organization
  has_many :users
end
