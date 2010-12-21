class Contact::PostsController < ApplicationController

  layout 'blog'
  def index
    require_user
    @posts = Comment.where("comments.comment_type != 'comment'").all
  end

  def show
    require_user
    @post = Comment.find(params[:id])
  end

  def new
    form_info
    @post = Comment.new
  end

  def create
    @post = Comment.new(params[:comment])
    if @post.spam? || @post.save
      flash[:notice] = "Thank you for contacting us, we will get back to you shortly."
      #redirect_to contact_post_url(@post)
      render :action => 'show'
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    require_user
    form_info
    @post = Comment.find(params[:id])
  end

  def update
    require_user
    @post = Comment.find(params[:id])
    if @post.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated post."
      redirect_to contact_post_url(@post)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    require_user
    @post = Comment.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to contact_posts_url
  end

  private

  def form_info
    @comment_types = ['General Question', 'Need a Consultant', 'Feedback', 'Business Proposal', 'Other']
  end
end
