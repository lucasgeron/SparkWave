class App::HealthUnitsController < ApplicationController
  before_action :set_app_health_unit, only: %i[ show edit update destroy ]

  # GET /app/health_units or /app/health_units.json
  def index
    @app_health_units = App::HealthUnit.all
  end

  # GET /app/health_units/1 or /app/health_units/1.json
  def show
  end

  # GET /app/health_units/new
  def new
    @app_health_unit = App::HealthUnit.new
  end

  # GET /app/health_units/1/edit
  def edit
  end

  # POST /app/health_units or /app/health_units.json
  def create
    @app_health_unit = App::HealthUnit.new(app_health_unit_params)

    respond_to do |format|
      if @app_health_unit.save
        format.html { redirect_to app_health_unit_url(@app_health_unit), notice: "Health unit was successfully created." }
        format.json { render :show, status: :created, location: @app_health_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/health_units/1 or /app/health_units/1.json
  def update
    respond_to do |format|
      if @app_health_unit.update(app_health_unit_params)
        format.html { redirect_to app_health_unit_url(@app_health_unit), notice: "Health unit was successfully updated." }
        format.json { render :show, status: :ok, location: @app_health_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/health_units/1 or /app/health_units/1.json
  def destroy
    @app_health_unit.destroy

    respond_to do |format|
      format.html { redirect_to app_health_units_url, notice: "Health unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_health_unit
      @app_health_unit = App::HealthUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_health_unit_params
      params.require(:app_health_unit).permit(:name, :city, :address, :phone, :type, :token)
    end
end
