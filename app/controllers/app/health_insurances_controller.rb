class App::HealthInsurancesController < ApplicationController
  before_action :set_app_health_insurance, only: %i[ show edit update destroy ]

  # GET /app/health_insurances or /app/health_insurances.json
  def index
    @app_health_insurances = App::HealthInsurance.all
  end

  # GET /app/health_insurances/1 or /app/health_insurances/1.json
  def show
  end

  # GET /app/health_insurances/new
  def new
    @app_health_insurance = App::HealthInsurance.new
  end

  # GET /app/health_insurances/1/edit
  def edit
  end

  # POST /app/health_insurances or /app/health_insurances.json
  def create
    @app_health_insurance = App::HealthInsurance.new(app_health_insurance_params)

    respond_to do |format|
      if @app_health_insurance.save
        format.html { redirect_to app_health_insurance_url(@app_health_insurance), notice: "Health insurance was successfully created." }
        format.json { render :show, status: :created, location: @app_health_insurance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_health_insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/health_insurances/1 or /app/health_insurances/1.json
  def update
    respond_to do |format|
      if @app_health_insurance.update(app_health_insurance_params)
        format.html { redirect_to app_health_insurance_url(@app_health_insurance), notice: "Health insurance was successfully updated." }
        format.json { render :show, status: :ok, location: @app_health_insurance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_health_insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/health_insurances/1 or /app/health_insurances/1.json
  def destroy
    @app_health_insurance.destroy

    respond_to do |format|
      format.html { redirect_to app_health_insurances_url, notice: "Health insurance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_health_insurance
      @app_health_insurance = App::HealthInsurance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_health_insurance_params
      params.require(:app_health_insurance).permit(:name)
    end
end
