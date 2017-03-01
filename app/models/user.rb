class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
   new_user = User.find_or_create_by(uid:auth["uid"])
   new_user.uid             = auth["uid"]
   new_user.nickname        = auth["info"]["nickname"]
   new_user.name            = auth["info"]["name"]
   new_user.description     = auth["info"]["description"]
   new_user.followers_count = auth["extra"]["raw_info"]["followers_count"]
   new_user.friends_count   = auth["extra"]["raw_info"]["friends_count"]
   new_user.save
   new_user
  end
end
