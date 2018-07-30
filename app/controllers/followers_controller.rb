class FollowersController < ApplicationController
  before_action :find_user

  def index
    @title = t "followers"
    @users = @user.followers.page params[:page]
  end
end
