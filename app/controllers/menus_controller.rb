class MenusController < ApplicationController
  
  before_filter :authenticate_admin!
  layout 'admin'
  # GET /menus
  # GET /menus.xml
  def index
    @menus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.xml
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.xml
  def new
    @menu = Menu.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.xml
  def create
    @menu = Menu.new(params[:menu])

    
      if @menu.save
        redirect_to menus_path, :notice => 'Menu was successfully created.'        
      else
        render :action => "new"        
      end
    
  end

  # PUT /menus/1
  # PUT /menus/1.xml
  def update
    @menu = Menu.find(params[:id])
    
      if @menu.update_attributes(params[:menu])
        redirect_to menus_path, :notice => 'Menu was successfully updated.'
      else
        render :action => "edit"        
      end

  end

  # DELETE /menus/1
  # DELETE /menus/1.xml
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to(menus_url) }
      format.xml  { head :ok }
    end
  end
end