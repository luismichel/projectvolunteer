class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :password_field
  end
end
