class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
   user = User.find_or_create_by(id:auth["id"])
   user.name = auth["name"]
   user.screen_name = auth["screen_name"]
   user.description  = auth["description"]
   user.followers_count = auth["followers_count"]
   user.friends_count = auth["friends_count"]
   user.save
   user
  end
end
