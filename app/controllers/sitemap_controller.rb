class SitemapController < ApplicationController
  layout 'blog'
  def index
    @posts = Post.all(:select => "title, id, updated_at", :order => "updated_at DESC", :limit => 50000)

    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end