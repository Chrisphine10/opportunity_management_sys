class ApplicationController < ActionController::Base
  before_action :authorize
  helper_method :admin?
  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  def only_admin
    user = User.find_by(id: session[:user_id])
    unless user.role == "Admin"
      redirect_to accounts_path, notice: "you are not admin"
      puts "check for error"
    end
  end

  def admin?
    session[:user_id] && User.find_by(id: session[:user_id]).role == "Admin"
  end
end
