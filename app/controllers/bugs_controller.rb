class BugsController < ApplicationController
  before_action :set_bug, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /bugs or /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1 or /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs or /bugs.json
  def create
    @project=Project.find(params[:project_id])
    @bug=@project.bugs.create(bug_params)
    @bug.creater_id = current_user.id
    authorize @bug
    if @bug.save
      redirect_to @project
 
  end
  end

  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    authorize @bug
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to project_url, notice: "Bug was successfully Updated." }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    authorize @bug
    @bug.destroy!

    respond_to do |format|
      format.html { redirect_to project_url, notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:title, :description, :b_type, :status, :deadline, :image, :project_id, :developer_id)
    end
end
