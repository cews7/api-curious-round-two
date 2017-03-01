class AddFriendsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :friends_count, :string
  end
end
