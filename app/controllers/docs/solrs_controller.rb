class Docs::SolrsController < ApplicationController
  # GET /docs/solrs
  # GET /docs/solrs.xml
  def index
    @docs_solrs = Docs::Solr.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @docs_solrs }
    end
  end

  # GET /docs/solrs/1
  # GET /docs/solrs/1.xml
  def show
    @docs_solr = Docs::Solr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @docs_solr }
    end
  end

  # GET /docs/solrs/new
  # GET /docs/solrs/new.xml
  def new
    @docs_solr = Docs::Solr.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @docs_solr }
    end
  end

  # GET /docs/solrs/1/edit
  def edit
    @docs_solr = Docs::Solr.find(params[:id])
  end

  # POST /docs/solrs
  # POST /docs/solrs.xml
  def create
    @docs_solr = Docs::Solr.new(params[:docs_solr])

    respond_to do |format|
      if @docs_solr.save
        format.html { redirect_to(@docs_solr, :notice => 'Solr was successfully created.') }
        format.xml  { render :xml => @docs_solr, :status => :created, :location => @docs_solr }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @docs_solr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/solrs/1
  # PUT /docs/solrs/1.xml
  def update
    @docs_solr = Docs::Solr.find(params[:id])

    respond_to do |format|
      if @docs_solr.update_attributes(params[:docs_solr])
        format.html { redirect_to(@docs_solr, :notice => 'Solr was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @docs_solr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/solrs/1
  # DELETE /docs/solrs/1.xml
  def destroy
    @docs_solr = Docs::Solr.find(params[:id])
    @docs_solr.destroy

    respond_to do |format|
      format.html { redirect_to(docs_solrs_url) }
      format.xml  { head :ok }
    end
  end
end
