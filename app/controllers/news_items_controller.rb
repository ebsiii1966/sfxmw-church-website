class NewsItemsController < ApplicationController
  # GET /news_items
  # GET /news_items.xml
  def index
    @news_items = NewsItem.current.order("post_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  def expired
    @news_items = NewsItem.expired.order("post_at DESC").all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @news_items }
    end
  end

  def future
    @news_items = NewsItem.future.order("post_at DESC").all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @news_items }
    end
  end

  def feed
    @news_items = NewsItem.order("post_at DESC").all
  
    respond_to do |format|
      format.html
      format.rss { render :layout => false } #feed.rss.builder
    end
  end

  # GET /news_items/1
  # GET /news_items/1.xml
  def show
    @news_item = NewsItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  # GET /news_items/new
  # GET /news_items/new.xml
  def new
    @news_item = NewsItem.new
    @readonly = false

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  # GET /news_items/1/edit
  def edit
    @news_item = NewsItem.find(params[:id])
    # @readonly = true  --a true value will show the picture location and not allow it to be changed
    @readonly = false
  end

  # POST /news_items
  # POST /news_items.xml
  def create
    @news_item = NewsItem.new(params[:news_item])
    @news_item.created_by = session[:user_id]
    
    respond_to do |format|
      if @news_item.save
        format.html { redirect_to(@news_item, :notice => 'News item was successfully created.') }
        format.xml  { render :xml => @news_item, :status => :created, :location => @news_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_items/1
  # PUT /news_items/1.xml
  def update
    @news_item = NewsItem.find(params[:id])
    @news_item.updated_by = session[:user_id]

    respond_to do |format|
      if @news_item.update_attributes(params[:news_item])
        format.html { redirect_to(@news_item, :notice => 'News item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.xml
  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    respond_to do |format|
      format.html { redirect_to(news_items_url) }
      format.xml  { head :ok }
    end
  end
end
