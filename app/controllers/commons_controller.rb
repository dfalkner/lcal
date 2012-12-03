class CommonsController < ApplicationController
  # GET /commons
  # GET /commons.json
  def index
    @commons = Common.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commons }
    end
  end

  # GET /commons/1
  # GET /commons/1.json
  def show
    @common = Common.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @common }
    end
  end

  # GET /commons/new
  # GET /commons/new.json
  def new
    @common = Common.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @common }
    end
  end

  # GET /commons/1/edit
  def edit
    @common = Common.find(params[:id])
  end

  # POST /commons
  # POST /commons.json
  def create
    @common = Common.new(params[:common])

    respond_to do |format|
      if @common.save
        format.html { redirect_to @common, notice: 'Common was successfully created.' }
        format.json { render json: @common, status: :created, location: @common }
      else
        format.html { render action: "new" }
        format.json { render json: @common.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commons/1
  # PUT /commons/1.json
  def update
    @common = Common.find(params[:id])

    respond_to do |format|
      if @common.update_attributes(params[:common])
        format.html { redirect_to @common, notice: 'Common was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @common.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commons/1
  # DELETE /commons/1.json
  def destroy
    @common = Common.find(params[:id])
    @common.destroy

    respond_to do |format|
      format.html { redirect_to commons_url }
      format.json { head :no_content }
    end
  end
end
