class Docs::CartHistoriesController < Docs::BaseController

  # GET /docs/cart_history
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
