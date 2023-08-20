class App::QueuesController < ApplicationController
  before_action :set_app_queue, only: %i[ show edit update destroy ]
  before_action :set_content_for_form, only: %i[ new edit create update ]

  # GET /app/queues or /app/queues.json
  def index
    @app_queues = App::Queue.all
    @app_health_units = App::HealthUnit.joins(:queues).distinct
  end

  # GET /app/queues/1 or /app/queues/1.json
  def show
  end

  # GET /app/queues/new
  # def new
  #   @app_queue = App::Queue.new(health_unit_id: params[:health_unit_id])
  # end

  # GET /app/queues/1/edit
  # def edit
  # end

  # POST /app/queues or /app/queues.json
  def create
    @app_queue = App::Queue.new(app_queue_params)

    respond_to do |format|
      if @app_queue.save
        format.html { redirect_to app_queue_url(@app_queue), notice: "Queue was successfully created." }
        format.json { render :show, status: :created, location: @app_queue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/queues/1 or /app/queues/1.json
  def update
    respond_to do |format|
      if @app_queue.update(app_queue_params)
        format.html { redirect_to app_queue_url(@app_queue), notice: "Queue was successfully updated." }
        format.json { render :show, status: :ok, location: @app_queue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/queues/1 or /app/queues/1.json
  def destroy
    @app_queue.destroy

    respond_to do |format|
      format.html { redirect_to app_queues_url, notice: "Queue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_queue
      @app_queue = App::Queue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_queue_params
      params.require(:app_queue).permit(:health_unit_id, :category)
    end

    def set_content_for_form
      @health_units = App::HealthUnit.all
      @categories = App::Queue::CATEGORIES.map { |category| [category, t("constants.app/queue.#{category}")] }
    end
end
