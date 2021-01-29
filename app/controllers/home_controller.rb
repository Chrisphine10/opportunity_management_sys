class HomeController < ApplicationController
  skip_before_action :authorize
  def index
  end
  def show
    @accounts = Account.paginate page: params[:page], per_page: 4
    @opportunities = Opportunity.paginate page: params[:page], per_page: 10
  end
end
