class Client::OrdersController < ApplicationController

  def create
    client_params = {
                      quantity: params[:quantity],
                      product_id: params[:product_id]
                      }

    response = Unirest.post(
                            "http://localhost:3000/api/orders", parameters: client_params)
    @order = response.body
    flash[:success] = "Successfully Ordered Product"
    redirect_to "/client/orders/#{@order['id']}"
  end

  def show
    response = Unirest.get("http://localhost:3000/api/orders/#{params[:id]}")
    @order = response.body
    render 'show.html.erb'
  end
end
