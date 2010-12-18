class CommentsController < ApplicationController
  before_filter :render_404, :except => [:create, :destroy, :preview, :mark_as_spam]
  before_filter :require_user, :only => [:destroy, :mark_as_spam]
  layout 'blog'

  def index
  end

  def show
  end

  def new
  end

  #POST /posts/1-hello-world/comments/preview
  def preview
    @post = Post.find(params[:post_id])

    if !@post.commentable #when comment form is gone, don't want automated spam sneaking through (shouldn't this get a 404)
       redirect_to post_url(@post)
    else
       @comment = @post.comments.build(params[:comment])

       #Comment properties business logic
       @comment.bang(current_user, request)

       #Simulate real comment
       @comment.id = 0
       @comment.created_at = Time.now

       respond_to do |format|
         format.html { redirect_to post_url(@post, :anchor => "comments") }
         format.js
       end
    end
  end

  # POST /posts/1-hello-world/comments
  def create
    #debugger
    @post = Post.find(params[:post_id])

    if !@post.commentable #when comment form is gone, don't want automated spam sneaking through
       render_404
    else
       @comment = @post.comments.build(params[:comment])

       #Comment properties business logic
       @comment.bang(current_user, request)

       #Check for spam
       if !current_user #don't want to send myself to the hungry anti spam bots
         if @comment.spam?
           @spam = @post.spams.build
           @spam.slice_and_dice(@comment)
           @spam.save

           #spoof some comment attributes - ironic, I know
           @comment.id = 0
           @comment.created_at = Time.now
         else
           @comment.save
         end
       else #admin
         @comment.save
       end

       respond_to do |format|
         format.html { redirect_to post_url(@post, :anchor => "comments") }
         format.js #still do this to fake out the human spammers - if spam, comment not saved
       end
    end
  end

  # DELETE /posts/1-hello-world/spams/1/mark_as_spam
  def mark_as_spam
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    #notify hungry anti spam bots that this comment is spam
    @comment.spam!

    #delete comment
    @comment.destroy

    redirect_to post_path(@post, :anchor => "comments")
  end

  def edit
  end

  def update
  end

  def destroy
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
     @comment.destroy

     redirect_to post_path(@post, :anchor => "comments")
  end
end
