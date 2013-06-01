class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :id_organization
      t.string :name
      t.string :address_hq
      t.string :phone_number
      t.string :website_url
      t.timestamp :register_date
      t.integer :id_user
      t.integer :id_category

      t.timestamps
    end
  end
end
