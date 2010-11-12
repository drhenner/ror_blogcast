require 'spec_helper'

describe Docs::SolrsController do

  describe "GET show" do
    it "assigns the requested solr as @solr" do
      get :show
    end
  end

end
