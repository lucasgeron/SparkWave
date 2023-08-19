class App::SpecializationsController < ApplicationController
  before_action :set_app_specialization, only: %i[ show edit update destroy ]

  # GET /app/specializations or /app/specializations.json
  def index
    @app_specializations = App::Specialization.all
  end

  # GET /app/specializations/1 or /app/specializations/1.json
  def show
  end

  # GET /app/specializations/new
  def new
    @app_specialization = App::Specialization.new
  end

  # GET /app/specializations/1/edit
  def edit
  end

  # POST /app/specializations or /app/specializations.json
  def create
    @app_specialization = App::Specialization.new(app_specialization_params)

    respond_to do |format|
      if @app_specialization.save
        format.html { redirect_to app_specialization_url(@app_specialization), notice: "Specialization was successfully created." }
        format.json { render :show, status: :created, location: @app_specialization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/specializations/1 or /app/specializations/1.json
  def update
    respond_to do |format|
      if @app_specialization.update(app_specialization_params)
        format.html { redirect_to app_specialization_url(@app_specialization), notice: "Specialization was successfully updated." }
        format.json { render :show, status: :ok, location: @app_specialization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/specializations/1 or /app/specializations/1.json
  def destroy
    @app_specialization.destroy

    respond_to do |format|
      format.html { redirect_to app_specializations_url, notice: "Specialization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_specialization
      @app_specialization = App::Specialization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_specialization_params
      params.require(:app_specialization).permit(:area_id, :name)
    end
end
