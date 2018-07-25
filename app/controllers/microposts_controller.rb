class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :find_micropost, only: :destroy

  def create
    @micropost = current_user.feed.build micropost_params

    if @micropost.save
      flash[:success] = t "flash.micropost_created"
      redirect_to root_url
    else
      @feed_items = current_user.feed.created_at_desc.page(params[:page])
                                .per Settings.micropost_per_page
      render "static_pages/home"
    end
  end

  def destroy
    flash[:success] = t "flash.micropost_deleted" if @micropost.destroy
    redirect_to request.referrer
  end

  private

  def micropost_params
    params.require(:micropost).permit :content, :picture
  end

  def find_micropost
    @micropost = current_user.feed.find_by id: params[:id]
    redirect_to root_url if @micropost.nil?
  end
end
