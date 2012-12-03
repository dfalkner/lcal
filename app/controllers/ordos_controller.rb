class OrdosController < ApplicationController
  # GET /ordos
  # GET /ordos.json
  def index
    @ordos = Ordo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ordos }
    end
  end

  # GET /ordos/1
  # GET /ordos/1.json
  def show
    @ordo = Ordo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ordo }
    end
  end

  # GET /ordos/new
  # GET /ordos/new.json
  def new
    @ordo = Ordo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ordo }
    end
  end

  # GET /ordos/1/edit
  def edit
    @ordo = Ordo.find(params[:id])
  end

  # POST /ordos
  # POST /ordos.json
  def create
    @ordo = Ordo.new(params[:ordo])

    respond_to do |format|
      if @ordo.save
        format.html { redirect_to @ordo, notice: 'Ordo was successfully created.' }
        format.json { render json: @ordo, status: :created, location: @ordo }
      else
        format.html { render action: "new" }
        format.json { render json: @ordo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ordos/1
  # PUT /ordos/1.json
  def update
    @ordo = Ordo.find(params[:id])

    respond_to do |format|
      if @ordo.update_attributes(params[:ordo])
        format.html { redirect_to @ordo, notice: 'Ordo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ordo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordos/1
  # DELETE /ordos/1.json
  def destroy
    @ordo = Ordo.find(params[:id])
    @ordo.destroy

    respond_to do |format|
      format.html { redirect_to ordos_url }
      format.json { head :no_content }
    end
  end
end
