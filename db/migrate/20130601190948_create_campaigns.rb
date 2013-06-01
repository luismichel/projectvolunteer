class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :id_campaign
      t.string :name
      t.integer :id_organization
      t.text :description
      t.integer :economic_goal
      t.integer :man_power_goal
      t.string :location
      t.datetime :date_event
      t.datetime :date_goal
      t.integer :id_category

      t.timestamps
    end
  end
end
