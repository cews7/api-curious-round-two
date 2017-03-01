class ChangeDataTypeForFriendsCountOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :friends_count, 'integer USING CAST(friends_count AS integer)'
  end
end
