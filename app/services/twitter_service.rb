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

# inside of UserInfo poro, you call this service to get raw data then parse it into objects with the data that you want to store

# class GithubRepo
# attr_reader :name, :full_name, :description, :updated_at, :language
#
#   def initialize(attributes = {})
#     @name = attributes[:name]
#     @full_name = attributes[:full_name]
#     @description = attributes[:description]
#     @updated_at = clean_date(attributes[:updated_at])
#     @language = attributes[:language]
#   end
#
#   def self.for_user(token)
#     GithubService.new(token).repos.map do |raw_repo|
#       GithubRepo.new(raw_repo)
#     end
#   end
#
#   def clean_date(raw_date)
#     d = DateTime.parse(raw_date)
#     d.strftime('%B %e, %Y at %H:%M')
#   end
#
# end
