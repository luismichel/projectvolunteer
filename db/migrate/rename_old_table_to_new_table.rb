class RenameOldTableToNewTable< ActiveRecord:Migration
    def self.up
        rename_table :CampaignMember, :CampaignMembers
    end 
    def self.down
        rename_table :CampaignMembers, :CampaignMember
    end
 end