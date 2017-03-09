class UserPresenter
  attr_reader :current_user
  def initialize(current_user)
    @current_user = current_user
  end

  def user_followers_count
    TwitterService.new(current_user).user_followers_count
  end

  def user_following_count
    TwitterService.new(current_user).user_following_count
  end

  def user_avatar
    TwitterService.new(current_user).user_avatar
  end
end
