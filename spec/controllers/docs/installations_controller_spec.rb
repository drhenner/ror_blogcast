require 'spec_helper'

describe Docs::InstallationsController do

  describe "GET show" do
    it "assigns the requested installation as @installation" do
      get :show
    end
  end

end
