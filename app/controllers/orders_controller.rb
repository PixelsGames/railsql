class OrdersController < ActionController::Base
  protect_from_forgery with: :exception

  def create
    order = Order.new(order_params)

    alert_text = order.save ? 'Спасибо, заявка принята!' : 'Заполните все поля'

    respond_to do |format|
      format.js { render js: "alert('#{alert_text}')" }
    end
  end

  private

  def order_params
    params.require(:order).permit(:guest_name, :message, :email)
  end
end