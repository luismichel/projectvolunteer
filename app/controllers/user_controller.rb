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

	def edit
		if(current_user)
			@user = current_user
		else
			redirect_to root_url
		end
	end

	def update
		if(current_user)
			@user = current_user

			respond_to do |format|
		      if (@user.update_attributes(params[:user]))
		        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
		        format.xml  { head :ok }
		      else
		        format.html { render :action => "edit" }
		        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
		      end
		    end
		    
		else
			redirect_to root_url
		end
	end


	def self.authenticate(username_or_email="", login_password="")
		if  EMAIL_REGEX.match(username_or_email)    
			user = User.find_by_email(username_or_email)
		else
			user = User.find_by_username(username_or_email)
		end

		if user.password == login_password
			return user
		else
			return false
		end
	end 


end
