class Docs::FulfillmentsController < Docs::BaseController

  # GET /docs/fulfillments/1
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
