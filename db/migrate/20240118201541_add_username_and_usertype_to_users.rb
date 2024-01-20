class AddUsernameAndUsertypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :usertype, :string
  end
end
