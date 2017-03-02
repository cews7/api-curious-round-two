class UserPresenter
  attr_reader :current_user
  def initialize(current_user)
    @current_user = current_user
  end

  def user_info
    TwitterService.new(current_user).user_info
  end
end
