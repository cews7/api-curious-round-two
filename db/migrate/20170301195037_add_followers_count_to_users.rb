class AddFollowersCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followers_count, :string
  end
end
