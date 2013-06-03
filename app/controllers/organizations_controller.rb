class OrganizationsController < ApplicationController
before_filter :check_for_cancel, :only => [:create, :update]

def check_for_cancel
  if params[:commit] == "Cancel"
    redirect_to "organization#index"
  end
end

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
		flash[:success] = "Changes saved!"
	else
		render "edit"
	end

end

def show

	@organization = Organization.find(params[:id])

end

def create
	
	@organization = Organization.new(params[:organization])

	if @organization.valid?

		if @organization.save 
			redirect_to @organization
		else
			flash[:error] = "An error ocurred creating the organization."
		end
	else

		render "new"
	end
end


def join
	@user = User.find(params[:id])
end

end
