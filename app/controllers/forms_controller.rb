class FormsController < ApplicationController
  # GET /forms
  # GET /forms.xml
  def index
    @forms = Form.current.order("post_at DESC").all
    @orgs = Org.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forms }
    end
  end

  def expired
    @forms = Form.expired.order("post_at DESC").all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @forms }
    end
  end

  def future
    @forms = Form.future.order("post_at DESC").all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.xml
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.xml
  def new
    @form = Form.new
    @readonly = false

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
    # @readonly = true  --a true value will show the picture location and not allow it to be changed
    @readonly = false
  end

  # POST /forms
  # POST /forms.xml
  def create
    @form = Form.new(params[:form])
    @form.created_by = session[:user_id]
    
    respond_to do |format|
      if @form.save
        format.html { redirect_to(@form, :notice => 'Form was successfully created.') }
        format.xml  { render :xml => @form, :status => :created, :location => @form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.xml
  def update
    @form = Form.find(params[:id])
    @form.updated_by = session[:user_id]

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to(@form, :notice => 'Form was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.xml
  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    respond_to do |format|
      format.html { redirect_to(forms_url) }
      format.xml  { head :ok }
    end
  end
end
