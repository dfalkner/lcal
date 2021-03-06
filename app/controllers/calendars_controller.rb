class CalendarsController < ApplicationController
#  respond_to :html, :xml, :json

  caches_page :index

  def index
    
    respond_to do |format|
      format.html do
        @q = Calendar.includes(:rank, :color, :season, :ordo).search(params[:q])
        @calendars = @q.result.paginate(:page => params[:page])
      end
      format.json do
        
 #       @calendars ||= Calendar.where("data >= ? and data <= ?", (Date.today - 30), (Date.today.end_of_year + (3 * 365)))
         if params[:updated_since].nil?
           @calendars ||= Calendar.includes(:rank, :color, :season, :ordo).where("data >= ? and data <= ? ", Date.today.beginning_of_year, Date.today.end_of_year + (1 * 365) )
         else
           updates_from = params[:updated_since].to_date.beginning_of_week
           @calendars ||= Calendar.includes(:rank, :color, :season, :ordo).where("data >= ? and data <= ? and updated_at >= ?", Date.today.beginning_of_year, Date.today.end_of_year + (1 * 365), updates_from )
         end
      end
      format.csv {@calendars ||= Calendar.where("data >= ? and data <= ? and (ordo_id = ? or ordo_id = ?) ", Date.today.beginning_of_year, Date.today.end_of_year + (1 * 365), Ordo.where("code = ?", "usa"), Ordo.where("code = ?", "gen") )}
    end
  end
  

  def show
   @calendar = Calendar.find(params[:id])
  end

  def new
    authorize! :index, @user, :message => 'Not authorized.'
    @calendar = Calendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calendar }
    end
  end

  # GET /calendars/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized.'
    @calendar = Calendar.find(params[:id])
  end

  # POST /calendars
  # POST /calendars.json
  def create
    authorize! :index, @user, :message => 'Not authorized.'
    @calendar = Calendar.new(params[:calendar])

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render json: @calendar, status: :created, location: @calendar }
      else
        format.html { render action: "new" }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    authorize! :index, @user, :message => 'Not authorized.'
    @calendar = Calendar.find(params[:id])

    respond_to do |format|
      if @calendar.update_attributes(params[:calendar])
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    authorize! :index, @user, :message => 'Not authorized.'
    @calendar = Calendar.find(params[:id])
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url }
      format.json { head :no_content }
    end
  end
  

end
