require 'rails_helper'

describe 'Twitter Service' do
  context '#user_info' do
    it 'retrieves user info' do
      VCR.use_cassette("user_info") do

        user = OpenStruct.new(
        screen_name: "cews7",
        token: ENV['TWITTER_ACCESS_TOKEN']
        )

        user_info = TwitterService.new(user).user_info
        expect(user_info.class).to eq Hash
      end
    end
  end
end
