class Docs::WishListsController < ApplicationController
  # GET /docs/wish_lists
  # GET /docs/wish_lists.xml
  def index
    @docs_wish_lists = Docs::WishList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @docs_wish_lists }
    end
  end

  # GET /docs/wish_lists/1
  # GET /docs/wish_lists/1.xml
  def show
    @docs_wish_list = Docs::WishList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @docs_wish_list }
    end
  end

  # GET /docs/wish_lists/new
  # GET /docs/wish_lists/new.xml
  def new
    @docs_wish_list = Docs::WishList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @docs_wish_list }
    end
  end

  # GET /docs/wish_lists/1/edit
  def edit
    @docs_wish_list = Docs::WishList.find(params[:id])
  end

  # POST /docs/wish_lists
  # POST /docs/wish_lists.xml
  def create
    @docs_wish_list = Docs::WishList.new(params[:docs_wish_list])

    respond_to do |format|
      if @docs_wish_list.save
        format.html { redirect_to(@docs_wish_list, :notice => 'Wish list was successfully created.') }
        format.xml  { render :xml => @docs_wish_list, :status => :created, :location => @docs_wish_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @docs_wish_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/wish_lists/1
  # PUT /docs/wish_lists/1.xml
  def update
    @docs_wish_list = Docs::WishList.find(params[:id])

    respond_to do |format|
      if @docs_wish_list.update_attributes(params[:docs_wish_list])
        format.html { redirect_to(@docs_wish_list, :notice => 'Wish list was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @docs_wish_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/wish_lists/1
  # DELETE /docs/wish_lists/1.xml
  def destroy
    @docs_wish_list = Docs::WishList.find(params[:id])
    @docs_wish_list.destroy

    respond_to do |format|
      format.html { redirect_to(docs_wish_lists_url) }
      format.xml  { head :ok }
    end
  end
end
