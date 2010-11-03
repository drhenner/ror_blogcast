class WelcomeController < ApplicationController
  # GET /welcome
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
