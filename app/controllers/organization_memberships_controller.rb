class OrganizationMembershipsController < ApplicationController
	def new
		@organizationMemberships = OrganizationMemberships.new
	end

	def create
		@organizationMemberships = OrganizationMemberships.new
		@organizationMemberships.user_id = params[:user_id]
		@organizationMemberships.organization_id = params[:organization_id]
		if @organizationMemberships.save
			redirect_to '/profile'
		end
	end
end
