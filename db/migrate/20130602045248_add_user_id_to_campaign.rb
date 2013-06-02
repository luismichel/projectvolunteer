class AddUserIdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :id_user, :integer
  end
end
