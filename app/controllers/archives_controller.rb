class ArchivesController < ApplicationController
  layout 'blog'
  def index
    @posts = Post.all(:select => "title, id, posted_at", :order => "posted_at DESC")
    @post_months = @posts.group_by { |t| t.posted_at.beginning_of_month }
  end
end
