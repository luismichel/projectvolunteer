class OrganizationMemberships < ActiveRecord::Base
  attr_accessible :organization_id, :user_id
  validates_uniqueness_of :user_id, :scope => :organization_id

  belongs_to :organization
  has_many :users
end
