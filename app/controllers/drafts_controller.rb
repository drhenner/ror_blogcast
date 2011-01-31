class DraftsController < ApplicationController
  before_filter :require_user
  layout 'blog'

  # GET /drafts
  def index
     @drafts = Draft.all(:select => "title, id", :order => "created_at DESC")
  end

  # GET /drafts/1/edit
  def edit
    @draft = Draft.find(params[:id])
  end

  # PUT /drafts/1
  def update
    @draft = Draft.find(params[:id])

    #Save both HTML and Markdown
    @draft.title = params[:draft][:title]
    @draft.markdown = params[:draft][:markdown]
    @draft.content = BlueCloth.new(@draft.markdown).to_html

    if params[:save_draft]
      if @draft.save
        render :action => "edit", :notice => "Draft was successfully updated."
      else
        render :action => "edit", :notice => "Draft was not updated."
      end
    end

    if params[:save_post]
      if @post = Post.save_from_draft(@draft)
        @draft.destroy
        redirect_to(@post, :notice => 'Post was successfully created.')
      else
        render :action => "edit"
      end
    end
  end

  # DELETE /drafts/1
  def destroy
    @draft = Draft.find(params[:id])
    @draft.destroy

    redirect_to(drafts_url)
  end
end
