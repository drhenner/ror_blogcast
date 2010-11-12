require 'spec_helper'

describe Info::AboutsController do

  describe "GET show" do
    it "assigns the requested about as @about" do
      get :show
    end
  end

end
