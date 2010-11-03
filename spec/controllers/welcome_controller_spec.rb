require 'spec_helper'

describe WelcomeController do
  

  describe "GET index" do
    it "assigns all welcomes as @welcomes" do
      get :index
    end
  end

end
