class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :force_json_format, except: :home

  def home
  end

private

  def force_json_format
    request.format = :json
  end
end
