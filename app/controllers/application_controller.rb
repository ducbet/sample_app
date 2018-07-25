class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "flash.pls_login"
    redirect_to login_url
  end

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t "flash.no_user"
    redirect_to root_url
  end
end
