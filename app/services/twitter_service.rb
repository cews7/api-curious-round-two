require 'twitter'

class TwitterService
  attr_reader :client, :nickname
  def initialize(user)
    @nickname    = user.nickname
    @avatar      = user.image
    @client      = Twitter::REST::Client.new do |config|
      config.consumer_key        = "#{ENV['TWITTER_KEY']}"
      config.consumer_secret     = "#{ENV['TWITTER_SECRET']}"
      config.access_token        = "#{ENV['TWITTER_ACCESS_TOKEN']}"
      config.access_token_secret = "#{ENV['TWITTER_ACCESS_TOKEN_SECRET']}"
    end
  end

  def user_followers_count
    client.followers("#{nickname}").count
  end

  def user_following_count
    client.friends("#{nickname}").count
  end

  def user_avatar
    @avatar
  end

  def json_parse(user_info)
    JSON.parse(user_info.body, symbolize_names: true)
  end
end
