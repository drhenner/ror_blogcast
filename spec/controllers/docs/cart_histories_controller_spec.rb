require 'spec_helper'

describe Docs::CartHistoriesController do

  describe "GET show" do
    it "assigns the requested cart_history as @cart_history" do
      get :show
    end
  end

end
