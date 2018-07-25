class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost = current_user.feed.build
    @feed_items = current_user.feed.created_at_desc.page(params[:page])
                              .per Settings.micropost_per_page
  end

  def help; end

  def about; end

  def contact; end
end
