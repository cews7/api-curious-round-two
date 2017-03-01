class ChangeDataTypeForFollowersCountOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :followers_count, 'integer USING CAST(followers_count AS integer)'
  end
end
