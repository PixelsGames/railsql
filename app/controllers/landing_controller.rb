class LandingController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    if current_user
      if current_user.user?
        redirect_to new_test_result_path
      else
        redirect_to admin_root_path
      end
    else
      redirect_to landing_path
    end
  end

  def landing
    @user = User.new
    @order = Order.new
    render 'index', layout: 'landing'
  end
end