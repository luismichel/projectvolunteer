class UserController < ApplicationController
	def new
		if(!current_user)
			@user = User.new
		else
			redirect_to root_url
		end
	end

	def create
		@user = User.new(params[:user])

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
	        format.xml  { render :xml => @user, :status => :created, :location => @user }
	      else
	        format.html { render :action => "new" }
	        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def show
		if(!params[:id])
			@user = current_user
		else
			@user = User.find(params[:id])
		end
	end
end
