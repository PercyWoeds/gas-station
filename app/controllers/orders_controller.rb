class OrdersController < ApplicationController
  respond_to :html

  def index
    @orders = Order.all.order(created_at: :desc)
    respond_with(@orders)
  end

  def show
    @order = Order.find(params[:id])
    respond_with(@order)
  end

  def new
    @order = current_operator.orders.new
    @gasolines = Gasoline.options_for_select
    respond_with(@order)
  end

  def create
    # if not enough gas, prohibit
    @gas = Gasoline.find(params[:order][:gas])
    gas_ordered = (params[:order][:sum].to_f / @gas.price).round(2)
    if !@gas.available? gas_ordered
      redirect_to :back, notice: "Not enough gas in tank" 
      return
    end
    @order = current_operator.orders.new(order_params)
    @order.gas = @gas.name
    @order.price = @gas.price
    @order.amount = gas_ordered
    @order.save
    @gas.outpour gas_ordered
    respond_with(@order)
  end

  private
    def order_params
      params.require(:order).permit(:gas, :sum)
    end
end
