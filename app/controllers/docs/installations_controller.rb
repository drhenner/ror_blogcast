class Docs::InstallationsController < Docs::BaseController

  # GET /docs/installation
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
