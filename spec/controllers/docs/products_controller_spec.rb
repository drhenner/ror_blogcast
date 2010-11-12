require 'spec_helper'

describe Docs::ProductsController do

  describe "GET show" do
    it "assigns the requested product as @product" do
      get :show
    end
  end

end
