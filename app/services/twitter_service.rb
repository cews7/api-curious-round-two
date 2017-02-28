class TwitterService
  attr_reader :user_token, :conn, :screen_name
  def initialize(user)
    @screen_name = user.screen_name
    @user_token  = user.token
    @conn        = Faraday.new(url: "https://api.twitter.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = user_token
    end
  end

  def user_info
    json_parse(conn.get "/1.1/show.json?screen_name=#{screen_name}")
  end

  def json_parse(user_info)
    JSON.parse(user_info.body, symbolize_names: true)
  end
end
