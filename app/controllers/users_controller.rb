class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    if session[:user_id]
      @users = User.order(:name)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
      end
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if session[:user_id]
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if session[:user_id]
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end

  # GET /users/1/edit
  def edit
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end

  # POST /users
  # POST /users.xml
  def create
    if session[:user_id]
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          format.html { redirect_to(users_url, 
            :notice => "User #{@user.name} was successfully created.") }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    if session[:user_id]
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to(users_url, 
            :notice => "User #{@user.name} was successfully updated.") }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    if session[:user_id]
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to :action => 'index', :controller => 'home'
    end
  end
end
