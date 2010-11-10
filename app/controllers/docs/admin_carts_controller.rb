class Docs::AdminCartsController < Docs::BaseController

  # GET /docs/admin_cart
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
