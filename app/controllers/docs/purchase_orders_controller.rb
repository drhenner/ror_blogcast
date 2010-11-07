class Docs::PurchaseOrdersController < Docs::BaseController

  # GET /docs/purchase_orders
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
