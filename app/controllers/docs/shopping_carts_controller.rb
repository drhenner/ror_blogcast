class Docs::ShoppingCartsController < ApplicationController

  # GET /docs/shopping_cart
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
