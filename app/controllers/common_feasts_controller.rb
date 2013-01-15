class CommonFeastsController < ApplicationController

  caches_page :index

  def index
    @common_feasts = CommonFeast.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @common_feasts }
    end
  end

  # GET /common_feasts/1
  # GET /common_feasts/1.json
  def show
    @common_feast = CommonFeast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @common_feast }
    end
  end

  # GET /common_feasts/new
  # GET /common_feasts/new.json
  def new
    authorize! :index, @user, :message => 'Not authorized.'
    @common_feast = CommonFeast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @common_feast }
    end
  end

  # GET /common_feasts/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized.'
    @common_feast = CommonFeast.find(params[:id])
  end

  # POST /common_feasts
  # POST /common_feasts.json
  def create
    authorize! :index, @user, :message => 'Not authorized.'
    @common_feast = CommonFeast.new(params[:common_feast])

    respond_to do |format|
      if @common_feast.save
        format.html { redirect_to @common_feast, notice: 'Common feast was successfully created.' }
        format.json { render json: @common_feast, status: :created, location: @common_feast }
      else
        format.html { render action: "new" }
        format.json { render json: @common_feast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /common_feasts/1
  # PUT /common_feasts/1.json
  def update
    authorize! :index, @user, :message => 'Not authorized.'
    @common_feast = CommonFeast.find(params[:id])

    respond_to do |format|
      if @common_feast.update_attributes(params[:common_feast])
        format.html { redirect_to @common_feast, notice: 'Common feast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @common_feast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common_feasts/1
  # DELETE /common_feasts/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized.'
    @common_feast = CommonFeast.find(params[:id])
    @common_feast.destroy

    respond_to do |format|
      format.html { redirect_to common_feasts_url }
      format.json { head :no_content }
    end
  end
end
