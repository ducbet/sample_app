class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.order_name.page(params[:page]).per Settings.index_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "flash.pls_check_mail"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    redirect_to root_url && return unless @user.activated?
    @microposts = @user.microposts.page(params[:page])
                       .per Settings.micropost_per_page
    @build_relationship = current_user.active_relationships.build
    @find_relationship = current_user.active_relationships
                                     .find_by followed_id: @user.id
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "flash.deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    redirect_to root_url unless @user.current_user? current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
