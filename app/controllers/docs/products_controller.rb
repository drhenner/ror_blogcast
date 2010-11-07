class Docs::ProductsController < Docs::BaseController

  # GET /docs/product
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
