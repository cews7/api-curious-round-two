class UserPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def user_followers
    TwitterService.new.user_info(current_user)
  end
end
