class PostsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  layout 'blog'
  # GET /posts
  def index
    @posts = Post.all(:select => "title, author, id, content, posted_at", :order => "posted_at DESC", :limit => 15)

    respond_to do |format|
      format.html
      #format.xml { render :xml => @posts  }
      #format.json { render :json => @posts }
      format.rss { render :layout => false } #index.rss.builder
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create

    @post = Post.new(params[:post]) #Need this here just in-case saving the draft fails.

    if params[:save_post]
      @post.commentable = true
      @post.posted_at = Time.now
      @post.author = current_user.name

      #Save both HTML and Markdown
      @post.content = BlueCloth.new(@post.markdown).to_html

      if @post.save
        redirect_to(@post, :notice => 'Post was successfully created.')
      else
        render :action => "new"
      end
    end

    if params[:save_draft]
      @draft = Draft.new(params[:post])

      @draft.author = current_user.name
      @draft.content = BlueCloth.new(@draft.markdown).to_html

     if @draft.save
        redirect_to(drafts_url, :notice => 'Draft was successfully created.')
      else
        render :action => "new"
      end
    end

  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    #Save both HTML and Markdown
    #Also use this method to toggle comments on and off
    #So, need to make sure :markdown attr is present so we know its an edit update
    if params[:post][:markdown]
      params[:post][:content]  = BlueCloth.new(params[:post][:markdown]).to_html
    end

    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url)
  end
end
