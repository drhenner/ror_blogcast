require 'spec_helper'

describe Docs::WishListsController do

  describe "GET show" do
    it "assigns the requested wish_list as @wish_list" do
      get :show
    end
  end

end
