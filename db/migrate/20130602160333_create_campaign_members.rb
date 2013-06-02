class CreateCampaignMembers < ActiveRecord::Migration
  def change
    create_table :campaign_members do |t|
      t.integer :id_user
      t.integer :id_campaign

      t.timestamps
    end
  end
end
