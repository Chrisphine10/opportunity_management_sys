class HomeController < ApplicationController
  skip_before_action :authorize
  def index
  end
  def show
    @accounts = Account.all
  end
end
