class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :description, :text
  end
end
