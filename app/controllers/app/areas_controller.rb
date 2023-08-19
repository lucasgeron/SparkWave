class App::AreasController < ApplicationController
  before_action :set_app_area, only: %i[ show edit update destroy ]

  # GET /app/areas or /app/areas.json
  def index
    @app_areas = App::Area.all
  end

  # GET /app/areas/1 or /app/areas/1.json
  def show
  end

  # GET /app/areas/new
  def new
    @app_area = App::Area.new
  end

  # GET /app/areas/1/edit
  def edit
  end

  # POST /app/areas or /app/areas.json
  def create
    @app_area = App::Area.new(app_area_params)

    respond_to do |format|
      if @app_area.save
        format.html { redirect_to app_area_url(@app_area), notice: "Area was successfully created." }
        format.json { render :show, status: :created, location: @app_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/areas/1 or /app/areas/1.json
  def update
    respond_to do |format|
      if @app_area.update(app_area_params)
        format.html { redirect_to app_area_url(@app_area), notice: "Area was successfully updated." }
        format.json { render :show, status: :ok, location: @app_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/areas/1 or /app/areas/1.json
  def destroy
    @app_area.destroy

    respond_to do |format|
      format.html { redirect_to app_areas_url, notice: "Area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_area
      @app_area = App::Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_area_params
      params.require(:app_area).permit(:name)
    end
end
