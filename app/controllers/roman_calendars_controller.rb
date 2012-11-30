class RomanCalendarsController < ApplicationController
  # GET /roman_calendars
  # GET /roman_calendars.json
  def index
    @roman_calendars = RomanCalendar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roman_calendars }
    end
  end

  # GET /roman_calendars/1
  # GET /roman_calendars/1.json
  def show
    @roman_calendar = RomanCalendar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roman_calendar }
    end
  end

  # GET /roman_calendars/new
  # GET /roman_calendars/new.json
  def new
    @roman_calendar = RomanCalendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @roman_calendar }
    end
  end

  # GET /roman_calendars/1/edit
  def edit
    @roman_calendar = RomanCalendar.find(params[:id])
  end

  # POST /roman_calendars
  # POST /roman_calendars.json
  def create
    @roman_calendar = RomanCalendar.new(params[:roman_calendar])

    respond_to do |format|
      if @roman_calendar.save
        format.html { redirect_to @roman_calendar, notice: 'Roman calendar was successfully created.' }
        format.json { render json: @roman_calendar, status: :created, location: @roman_calendar }
      else
        format.html { render action: "new" }
        format.json { render json: @roman_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roman_calendars/1
  # PUT /roman_calendars/1.json
  def update
    @roman_calendar = RomanCalendar.find(params[:id])

    respond_to do |format|
      if @roman_calendar.update_attributes(params[:roman_calendar])
        format.html { redirect_to @roman_calendar, notice: 'Roman calendar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roman_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roman_calendars/1
  # DELETE /roman_calendars/1.json
  def destroy
    @roman_calendar = RomanCalendar.find(params[:id])
    @roman_calendar.destroy

    respond_to do |format|
      format.html { redirect_to roman_calendars_url }
      format.json { head :no_content }
    end
  end
end
