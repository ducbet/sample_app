class FollowingsController < ApplicationController
  before_action :find_user

  def index
    @title = t "following"
    @users = @user.following.page params[:page]
  end
end
