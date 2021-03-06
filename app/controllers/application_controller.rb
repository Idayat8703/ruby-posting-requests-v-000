class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

private

  def authenticate_user
    client_id = ENV['VFGYFQC5S0OLTCG523Y0SAUVZK3ONN3KETVKCM5TS0QEXBRN']
    redirect_uri = CGI.escape("http://159.203.84.37:30004/auth")
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to foursquare_url unless logged_in?
  end

  def logged_in?
    !!session[:token]
  end
end
