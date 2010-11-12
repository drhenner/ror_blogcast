class Info::AboutsController < ApplicationController

  # GET /info/about
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
