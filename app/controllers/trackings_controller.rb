class TrackingsController < ApplicationController
  # GET /trackings
  # GET /trackings.json
  def index
    @trackings = Tracking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trackings }
    end
  end

  # GET /trackings/1
  # GET /trackings/1.json
  def show
    @tracking = Tracking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tracking }
    end
  end

  # GET /trackings/new
  # GET /trackings/new.json
  def new
    @tracking = Tracking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tracking }
    end
  end

  # GET /trackings/1/edit
  def edit
    @tracking = Tracking.find(params[:id])
  end

  # POST /trackings
  # POST /trackings.json
  def create
    @tracking = Tracking.new(params[:tracking])
    
    @tracking.ftpqueue = nil
    @tracking.ftpstart = nil
    @tracking.ftpcomplete = nil
    @tracking.importqueue = Time.now
    @tracking.importstart = nil
    @tracking.importcomplete = nil

    respond_to do |format|
      if @tracking.save
        `at -f \"#{Rails.root}/app/scripts/launcher.sh\" -M now + 2 minutes`
        
        format.html { redirect_to @tracking, notice: 'Tracking was successfully created.' }
        format.json { render json: @tracking, status: :created, location: @tracking }
      else
        format.html { render action: "new" }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trackings/1
  # PUT /trackings/1.json
  def update
    @tracking = Tracking.find(params[:id])

    respond_to do |format|
      if @tracking.update_attributes(params[:tracking])
        format.html { redirect_to @tracking, notice: 'Tracking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackings/1
  # DELETE /trackings/1.json
  def destroy
    @tracking = Tracking.find(params[:id])
    @tracking.destroy

    respond_to do |format|
      format.html { redirect_to trackings_url }
      format.json { head :no_content }
    end
  end
end
