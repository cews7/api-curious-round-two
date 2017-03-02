class TwitterService
  attr_reader :user_token, :conn, :nickname
  def initialize(user)
    @nickname    = user.nickname
    @user_token  = user.token
    @conn        = Faraday.new(url: "https://api.twitter.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = user_token
    end
  end

  def user_info
    json_parse(conn.get "/1.1/users/show.json?screen_name=#{nickname}")
  end

  def json_parse(user_info)
    binding.pry
    JSON.parse(user_info.body, symbolize_names: true)
  end
end
