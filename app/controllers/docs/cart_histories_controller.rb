class Docs::CartHistoriesController < ApplicationController
  # GET /docs/cart_histories
  # GET /docs/cart_histories.xml
  def index
    @docs_cart_histories = Docs::CartHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @docs_cart_histories }
    end
  end

  # GET /docs/cart_histories/1
  # GET /docs/cart_histories/1.xml
  def show
    @docs_cart_history = Docs::CartHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @docs_cart_history }
    end
  end

  # GET /docs/cart_histories/new
  # GET /docs/cart_histories/new.xml
  def new
    @docs_cart_history = Docs::CartHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @docs_cart_history }
    end
  end

  # GET /docs/cart_histories/1/edit
  def edit
    @docs_cart_history = Docs::CartHistory.find(params[:id])
  end

  # POST /docs/cart_histories
  # POST /docs/cart_histories.xml
  def create
    @docs_cart_history = Docs::CartHistory.new(params[:docs_cart_history])

    respond_to do |format|
      if @docs_cart_history.save
        format.html { redirect_to(@docs_cart_history, :notice => 'Cart history was successfully created.') }
        format.xml  { render :xml => @docs_cart_history, :status => :created, :location => @docs_cart_history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @docs_cart_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/cart_histories/1
  # PUT /docs/cart_histories/1.xml
  def update
    @docs_cart_history = Docs::CartHistory.find(params[:id])

    respond_to do |format|
      if @docs_cart_history.update_attributes(params[:docs_cart_history])
        format.html { redirect_to(@docs_cart_history, :notice => 'Cart history was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @docs_cart_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/cart_histories/1
  # DELETE /docs/cart_histories/1.xml
  def destroy
    @docs_cart_history = Docs::CartHistory.find(params[:id])
    @docs_cart_history.destroy

    respond_to do |format|
      format.html { redirect_to(docs_cart_histories_url) }
      format.xml  { head :ok }
    end
  end
end
