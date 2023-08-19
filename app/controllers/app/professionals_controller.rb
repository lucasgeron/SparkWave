class App::ProfessionalsController < ApplicationController
  before_action :set_app_professional, only: %i[ show edit update destroy ]

  # GET /app/professionals or /app/professionals.json
  def index
    @app_professionals = App::Professional.all
  end

  # GET /app/professionals/1 or /app/professionals/1.json
  def show
  end

  # GET /app/professionals/new
  def new
    @app_professional = App::Professional.new
  end

  # GET /app/professionals/1/edit
  def edit
  end

  # POST /app/professionals or /app/professionals.json
  def create
    @app_professional = App::Professional.new(app_professional_params)

    respond_to do |format|
      if @app_professional.save
        format.html { redirect_to app_professional_url(@app_professional), notice: "Professional was successfully created." }
        format.json { render :show, status: :created, location: @app_professional }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/professionals/1 or /app/professionals/1.json
  def update
    respond_to do |format|
      if @app_professional.update(app_professional_params)
        format.html { redirect_to app_professional_url(@app_professional), notice: "Professional was successfully updated." }
        format.json { render :show, status: :ok, location: @app_professional }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/professionals/1 or /app/professionals/1.json
  def destroy
    @app_professional.destroy

    respond_to do |format|
      format.html { redirect_to app_professionals_url, notice: "Professional was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_professional
      @app_professional = App::Professional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_professional_params
      params.require(:app_professional).permit(:name, :crm, :role)
    end
end
