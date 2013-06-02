class AddAttachmentAvatarToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :campaigns, :avatar
  end
end
