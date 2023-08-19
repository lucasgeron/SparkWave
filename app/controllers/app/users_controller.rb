class App::UsersController < ApplicationController
  before_action :set_app_user, only: %i[ show edit update destroy ]

  # GET /app/users or /app/users.json
  def index
    @app_users = App::User.all
  end

  # GET /app/users/1 or /app/users/1.json
  def show
  end

  # GET /app/users/new
  def new
    @app_user = App::User.new
  end

  # GET /app/users/1/edit
  def edit
  end

  # POST /app/users or /app/users.json
  def create
    @app_user = App::User.new(app_user_params)

    respond_to do |format|
      if @app_user.save
        format.html { redirect_to app_user_url(@app_user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @app_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/users/1 or /app/users/1.json
  def update
    respond_to do |format|
      if @app_user.update(app_user_params)
        format.html { redirect_to app_user_url(@app_user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @app_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/users/1 or /app/users/1.json
  def destroy
    @app_user.destroy

    respond_to do |format|
      format.html { redirect_to app_users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_user
      @app_user = App::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_user_params
      params.require(:app_user).permit(:finished, :queue_id)
    end
end
