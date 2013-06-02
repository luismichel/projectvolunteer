class CampaignController < ApplicationController
	def new
		if(current_user)
			@campaign = Campaign.new
		else
			redirect_to root_url
		end
	end

	def create
		if(current_user)
			@campaign = Campaign.new(params[:user])

		    respond_to do |format|
		      if @user.save
		        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
		        format.xml  { render :xml => @user, :status => :created, :location => @user }
		      else
		        format.html { render :action => "new" }
		        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
		      end
		    end
		else
			redirect_to root_url
		end
	end

	def edit
	end

	def update
	end

end
