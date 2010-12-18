class Info::AboutsController < ApplicationController
  layout 'welcome'
  # GET /info/about
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
