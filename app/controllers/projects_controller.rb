class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    # @projects = Project.all
    @projects = policy_scope(Project)
  end

  def show
    @drawings = Drawing.all
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    @project.save
    redirect_to project_path(@project)
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  # user_ids: [] is an array of user ids used to associate users with a project
  def project_params
    params.require(:project).permit(:name, :address, :company, user_ids: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
