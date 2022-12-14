class TopController < ApplicationController
  before_action :require_login, except: :index
  def index
  end
end
