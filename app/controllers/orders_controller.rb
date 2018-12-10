class OrdersController < ApplicationController

  after_action :set_authorize, only: [:show, :find]
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    order = Order.create!(product_id: product.id, amount: product.price, state: 'pending', user: current_user)
    authorize order

    redirect_to new_order_payment_path(order)

  end

  def find

  end

private
  def set_order
    @order = Order.find(params[:id])
  end


  def order_params
    params.require(:order).permit(:state, :amount, :payment, :user_id, :producttype_id)
   end

  def set_authorize
   authorize @order
  end


end
