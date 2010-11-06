class Docs::ConfigsController < Docs::BaseController

  # GET /docs/config
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
