class Docs::PurchaseOrdersController < ApplicationController
  # GET /docs/purchase_orders
  # GET /docs/purchase_orders.xml
  def index
    @docs_purchase_orders = Docs::PurchaseOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @docs_purchase_orders }
    end
  end

  # GET /docs/purchase_orders/1
  # GET /docs/purchase_orders/1.xml
  def show
    @docs_purchase_order = Docs::PurchaseOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @docs_purchase_order }
    end
  end

  # GET /docs/purchase_orders/new
  # GET /docs/purchase_orders/new.xml
  def new
    @docs_purchase_order = Docs::PurchaseOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @docs_purchase_order }
    end
  end

  # GET /docs/purchase_orders/1/edit
  def edit
    @docs_purchase_order = Docs::PurchaseOrder.find(params[:id])
  end

  # POST /docs/purchase_orders
  # POST /docs/purchase_orders.xml
  def create
    @docs_purchase_order = Docs::PurchaseOrder.new(params[:docs_purchase_order])

    respond_to do |format|
      if @docs_purchase_order.save
        format.html { redirect_to(@docs_purchase_order, :notice => 'Purchase order was successfully created.') }
        format.xml  { render :xml => @docs_purchase_order, :status => :created, :location => @docs_purchase_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @docs_purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/purchase_orders/1
  # PUT /docs/purchase_orders/1.xml
  def update
    @docs_purchase_order = Docs::PurchaseOrder.find(params[:id])

    respond_to do |format|
      if @docs_purchase_order.update_attributes(params[:docs_purchase_order])
        format.html { redirect_to(@docs_purchase_order, :notice => 'Purchase order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @docs_purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/purchase_orders/1
  # DELETE /docs/purchase_orders/1.xml
  def destroy
    @docs_purchase_order = Docs::PurchaseOrder.find(params[:id])
    @docs_purchase_order.destroy

    respond_to do |format|
      format.html { redirect_to(docs_purchase_orders_url) }
      format.xml  { head :ok }
    end
  end
end
