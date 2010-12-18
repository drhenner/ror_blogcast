class SpamsController < ApplicationController
  before_filter :require_user
  layout 'blog'
  # POST /posts/1-hello-world/spams
  def index
    @spam_count = Spam.count

    if params[:post_id].to_i > 0
      @post = Post.find(params[:post_id])
    else
      @posts = Post.all(:order => "posted_at DESC")
    end
  end

  # DELETE /posts/1-hello-world/spams/1/mark_as_ham
  def mark_as_ham
    @post = Post.find(params[:post_id])
    @spam = Spam.find(params[:id])

    #mark as ham - hungry anti spam bots got this one wrong
    @spam.ham!

    #add comment to post
    @comment = @post.comments.build
    @comment.slice_and_dice(@spam)

    if @comment.save
      #delete from spams
      @spam.destroy
      redirect_to post_path(@post, :anchor => "comments")
    else
      redirect_to post_path(@post, :anchor => "comments")
    end
  end

  # DELETE /posts/1-hello-world/spams/1
  def destroy
    @post = Post.find(params[:post_id])
    @spam = Spam.find(params[:id])
    @spam.destroy

    #redirect_to post_spams_path(@post)
    redirect_to post_spams_path(0)
  end

  # DELETE /posts/1-hello-world/spams/incinerate
  def incinerate
    if params[:post_id].to_i > 0 #destroy all spam for this post
      @post = Post.find(params[:post_id])
      @post.spams.destroy_all
      #redirect_to post_spams_path(@post)
      redirect_to post_spams_path(0)
    else #destroy all spam in every single post
      Spam.destroy_all
      redirect_to post_spams_path(0)
    end
  end
end
