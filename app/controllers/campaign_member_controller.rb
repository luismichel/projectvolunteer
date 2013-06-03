class CampaignMemberController < ApplicationController
	def create

		if(!current_user)
			redirect_to "/login" and return
		end 

		@campaignMember = CampaignMember.new
		@campaignMember.id_user = params[:id_user]
		@campaignMember.id_campaign = params[:id_campaign]

		if (@campaignMember.save)
			flash[:success] = "You've just volunteered for campaign \"" + Campaign.find(params[:id_campaign]).name + "\"!"
			redirect_to '/profile'
		else
			flash[:error] = 'An error ocurred joining the campaign'
			redirect_to Campaign.find(params[:id_campaign])
		end

	end
end
