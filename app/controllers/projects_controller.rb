class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /projects or /projects.json
  def index
    #@projects = Project.all
    if current_user.usertype=="developer"
      project_ids = []
      Project.all.each do |project|
          if project.users.present? && project.users.where(usertype: "developer").pluck(:id).include?(current_user.id)
              project_ids << project.id
          end
      end
      @projects = Project.where(id: project_ids)
  else
      @projects=Project.all
  end
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.project_users.build
    authorize @project
  end

  # GET /projects/1/edit
  def edit
    authorize @project
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    authorize @project
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    authorize @project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    authorize @project
    @project.destroy!
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, project_users_attributes: [:id,:project_id, :user_id,:_destroy])
     
    end
end
