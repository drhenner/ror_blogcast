class Docs::ShipmentsController < Docs::BaseController

  # GET /docs/shipments/1
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
