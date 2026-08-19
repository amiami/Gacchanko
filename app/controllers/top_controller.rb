class TopController < ApplicationController
  allow_unauthenticated_access

  def index
    redirect_to home_path if authenticated?
  end
end
