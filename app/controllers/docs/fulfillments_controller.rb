class Docs::FulfillmentsController < ApplicationController
  # GET /docs/fulfillments
  # GET /docs/fulfillments.xml
  def index
    @docs_fulfillments = Docs::Fulfillment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @docs_fulfillments }
    end
  end

  # GET /docs/fulfillments/1
  # GET /docs/fulfillments/1.xml
  def show
    @docs_fulfillment = Docs::Fulfillment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @docs_fulfillment }
    end
  end

  # GET /docs/fulfillments/new
  # GET /docs/fulfillments/new.xml
  def new
    @docs_fulfillment = Docs::Fulfillment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @docs_fulfillment }
    end
  end

  # GET /docs/fulfillments/1/edit
  def edit
    @docs_fulfillment = Docs::Fulfillment.find(params[:id])
  end

  # POST /docs/fulfillments
  # POST /docs/fulfillments.xml
  def create
    @docs_fulfillment = Docs::Fulfillment.new(params[:docs_fulfillment])

    respond_to do |format|
      if @docs_fulfillment.save
        format.html { redirect_to(@docs_fulfillment, :notice => 'Fulfillment was successfully created.') }
        format.xml  { render :xml => @docs_fulfillment, :status => :created, :location => @docs_fulfillment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @docs_fulfillment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/fulfillments/1
  # PUT /docs/fulfillments/1.xml
  def update
    @docs_fulfillment = Docs::Fulfillment.find(params[:id])

    respond_to do |format|
      if @docs_fulfillment.update_attributes(params[:docs_fulfillment])
        format.html { redirect_to(@docs_fulfillment, :notice => 'Fulfillment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @docs_fulfillment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/fulfillments/1
  # DELETE /docs/fulfillments/1.xml
  def destroy
    @docs_fulfillment = Docs::Fulfillment.find(params[:id])
    @docs_fulfillment.destroy

    respond_to do |format|
      format.html { redirect_to(docs_fulfillments_url) }
      format.xml  { head :ok }
    end
  end
end
