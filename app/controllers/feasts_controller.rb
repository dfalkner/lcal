class FeastsController < ApplicationController
 
  caches_page :index

  def index
    @feasts = Feast.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feasts }
    end
  end

  # GET /feasts/1
  # GET /feasts/1.json
  def show
    @feast = Feast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feast }
    end
  end

  # GET /feasts/new
  # GET /feasts/new.json
  def new
    authorize! :index, @user, :message => 'Not authorized.'
    @feast = Feast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feast }
    end
  end

  # GET /feasts/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized.'
    @feast = Feast.find(params[:id])
  end

  # POST /feasts
  # POST /feasts.json
  def create
    authorize! :index, @user, :message => 'Not authorized.'
    @feast = Feast.new(params[:feast])

    respond_to do |format|
      if @feast.save
        format.html { redirect_to @feast, notice: 'Feast was successfully created.' }
        format.json { render json: @feast, status: :created, location: @feast }
      else
        format.html { render action: "new" }
        format.json { render json: @feast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feasts/1
  # PUT /feasts/1.json
  def update
    authorize! :index, @user, :message => 'Not authorized.'
    @feast = Feast.find(params[:id])

    respond_to do |format|
      if @feast.update_attributes(params[:feast])
        format.html { redirect_to @feast, notice: 'Feast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feasts/1
  # DELETE /feasts/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized.'
    @feast = Feast.find(params[:id])
    @feast.destroy

    respond_to do |format|
      format.html { redirect_to feasts_url }
      format.json { head :no_content }
    end
  end
end
