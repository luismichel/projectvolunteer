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
		else
			
			flash[:error] = "An error ocurred joining \"" + Organization.find(params[:organization_id]).name + "\""
			redirect_to Organization.find(params[:organization_id])
		end
	end
end
