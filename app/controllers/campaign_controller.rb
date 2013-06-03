class CampaignController < ApplicationController
	def new
		if(current_user)
			@campaign = Campaign.new
		else
			redirect_to root_url
		end
	end

	def index
		@campaigns = Campaign.all
	end

	def create
		if(current_user)
			@campaign = Campaign.new(params[:campaign])

		    respond_to do |format|
		      if @campaign.save
		      	flash[:success] = 'Campaign was successfully created.'
		        format.html { redirect_to(@campaign, :notice => 'Campaign was successfully created.') }
		        format.xml  { render :xml => @campaign, :status => :created, :location => @campaign }
		      else
		      	flash[:error] = 'An error ocurred creating the campaign.'
		        format.html { render :action => "new" }
		        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
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

	def show
		@campaign = Campaign.find(params[:id])
	end

end
