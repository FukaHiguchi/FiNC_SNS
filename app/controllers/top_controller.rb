class TopController < ApplicationController
  before_action :require_login
  def index
    render plain:"hello"
  end
end
