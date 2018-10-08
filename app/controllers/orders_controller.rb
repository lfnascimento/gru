class OrdersController < ApplicationController

  before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    respond_with(@order, location: root_path)
  end

  private

  def order_params
    params
      .require(:order)
      .permit(:quantity, :observation, :product_id)
      .merge(user_id: current_user.id)
  end

end
