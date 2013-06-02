class OrganizationsController < ApplicationController

def new
	@organization = Organization.new
end

def index
end

def show

	@organization = Organization.find(params[:id])

end

def create
	
	@organization = Organization.new(params[:organization])

	if @organization.save 
		redirect_to @organization
	else

	end
end

end
