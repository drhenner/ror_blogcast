class Docs::WishListsController < Docs::BaseController

  # GET /docs/wish_list
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
