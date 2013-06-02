class CreateOrganizationMemberships < ActiveRecord::Migration
  def change
    create_table :organization_memberships do |t|
      t.integer :organization_id
      t.integer :user_id

      t.timestamps
    end

	add_index :organization_memberships, :organization_id
	add_index :organization_memberships, :user_id
	add_index :organization_memberships, [:organization_id, :user_id], unique: true

  end
end
