class OrganizationsController < ApplicationController

def new

	if(!current_user)
		redirect_to "/login"
	end

	@organization = Organization.new
end

def index

	@organizations = Organization.all

end

def edit

	@organization = Organization.find(params[:id])

	if(!current_user)
		redirect_to @organization
	else 	if(current_user[:id] != @organization.id_user)
		redirect_to @organization
		end
	end

end


def update

	@organization = Organization.find(params[:id])
	
	if @organization.update_attributes(params[:organization])
		redirect_to @organization
	else
		render "edit"
	end

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
