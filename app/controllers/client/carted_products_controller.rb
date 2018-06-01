class Client::CartedProductsController < ApplicationController

  def index 
    @carted_products = 
  end
  
  def create
    client_params = {   
                      product_id: params[:product_id],
                      quantity: params[:quantity]
                    }

  response = Unirest.post("http://localhost:3000/api/carted_products", parameters: client_params)
  @carted_product = response.body
  render 'show.html.erb'

  # flash[:success] = "Your Order Has Been Placed!"
  # redirect_to "/client/carted_products/#{@carted_products['id']}"

  end
end
