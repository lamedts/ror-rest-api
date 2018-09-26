class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.paginate(page: params[:page], per_page: params[:per_page])
    json_response(@orders)
  end

  # POST /orders
  def create

    @order = Order.create!({ status: order_params[:status] })
    @origin = Origin.create!({ 
      latitude: order_params[:destination_lat], 
      longtitude: order_params[:destination_lat],
      order_id: @order.id
    })
    @destination = Destination.create!({ 
      latitude: order_params[:destination_lat], 
      longtitude: order_params[:destination_lat],
      order_id: @order.id
    })
    
    json_response(@order, :created)
  end

  # GET /orders/:id
  def show
    json_response(@order)
  end

  # PUT /orders/:id
  def update
    @order.update(order_params)
    head :no_content
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    # whitelist params
    params.permit(:status, :origin_lat, :origin_long, :destination_lat, :destination_long)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
