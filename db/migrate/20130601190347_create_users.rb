class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id_user
      t.string :name
      t.integer :age
      t.string :gender
      t.string :facebook_token
      t.text :bio
      t.boolean :is_active
      t.string :email

      t.timestamps
    end
  end
end
