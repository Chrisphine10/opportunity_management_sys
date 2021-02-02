class HomeController < ApplicationController
  skip_before_action :authorize
  ACCOUNTS_SIZE = 4
  OPPS_SIZE = 10
  def index
    @users = User.where(role: "Admin")
  end
  def show
    @page = (params[:page] || 0).to_i
    @sage = (params[:sage] || 0).to_i
    @accounts = Account.offset(ACCOUNTS_SIZE * @page).limit(ACCOUNTS_SIZE)
    @opportunities = Opportunity.offset(OPPS_SIZE * @sage).limit(OPPS_SIZE)
  end

end
