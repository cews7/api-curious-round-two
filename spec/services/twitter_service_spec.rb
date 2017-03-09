require 'rails_helper'

describe 'Twitter Service' do
  context '#user_followers_count' do
    it 'retrieves user followers_count' do
      VCR.use_cassette("followers_count") do

        user = OpenStruct.new(
        screen_name: "cews7",
        token: ENV['TWITTER_ACCESS_TOKEN']
        )

        user_followers_count = TwitterService.new(user).user_followers_count
        expect(user_followers_count.class).to eq Fixnum
      end
    end
  end

  context '#user_following_count' do
    it 'retrieves user following_count' do
      VCR.use_cassette("following_count") do

        user = OpenStruct.new(
        screen_name: "cews7",
        token: ENV['TWITTER_ACCESS_TOKEN']
        )

        user_following_count = TwitterService.new(user).user_following_count
        expect(user_following_count.class).to eq Fixnum
      end
    end
  end

  context '#user_avatar' do
    it 'retrieves user avatar' do
      VCR.use_cassette("avatar") do

        user = OpenStruct.new(
        screen_name: "cews7",
        token: ENV['TWITTER_ACCESS_TOKEN'],
        image: 'sample.jpg'
        )

        user_avatar = TwitterService.new(user).user_avatar
        expect(user_avatar.class).to eq String
        expect(user_avatar).to include ".jpg"
      end
    end
  end
end
