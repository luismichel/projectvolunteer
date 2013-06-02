class CampaignMemberController < ApplicationController
	def create

		@campaignMember = CampaignMember.new
		@campaignMember.id_user = params[:id_user]
		@campaignMember.id_campaign = params[:id_campaign]

		if (@campaignMember.save)
			redirect_to '/profile'
		end

	end
end
