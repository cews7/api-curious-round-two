require 'rails_helper'

describe 'Twitter Service' do
  context '#user_info' do
    it 'retrieves user info' do
      VCR.use_cassette("user_info") do

        user = OpenStruct.new(
        screen_name: "cews7",
        token: ENV['TWITTER_ACCESS_TOKEN']
        )

        user_followers_count = TwitterService.new(user).user_followers_count
        expect(user_followers_count.class).to eq Fixnum
      end
    end
  end
end
