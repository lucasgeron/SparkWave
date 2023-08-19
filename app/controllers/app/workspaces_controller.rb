class App::WorkspacesController < ApplicationController
  before_action :set_app_workspace, only: %i[ show edit update destroy ]

  # GET /app/workspaces or /app/workspaces.json
  def index
    @app_workspaces = App::Workspace.all
  end

  # GET /app/workspaces/1 or /app/workspaces/1.json
  def show
  end

  # GET /app/workspaces/new
  def new
    @app_workspace = App::Workspace.new
  end

  # GET /app/workspaces/1/edit
  def edit
  end

  # POST /app/workspaces or /app/workspaces.json
  def create
    @app_workspace = App::Workspace.new(app_workspace_params)

    respond_to do |format|
      if @app_workspace.save
        format.html { redirect_to app_workspace_url(@app_workspace), notice: "Workspace was successfully created." }
        format.json { render :show, status: :created, location: @app_workspace }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/workspaces/1 or /app/workspaces/1.json
  def update
    respond_to do |format|
      if @app_workspace.update(app_workspace_params)
        format.html { redirect_to app_workspace_url(@app_workspace), notice: "Workspace was successfully updated." }
        format.json { render :show, status: :ok, location: @app_workspace }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/workspaces/1 or /app/workspaces/1.json
  def destroy
    @app_workspace.destroy

    respond_to do |format|
      format.html { redirect_to app_workspaces_url, notice: "Workspace was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_workspace
      @app_workspace = App::Workspace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_workspace_params
      params.require(:app_workspace).permit(:health_unit_id)
    end
end
