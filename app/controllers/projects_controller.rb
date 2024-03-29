class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    # @projects = Project.all
    # If I do below, policy scope is not applied to projects, so admin cannot see all
    # @projects = current_user.projects

    # If I do below, policy scope is applied to projects, so admin can see all, but user can't see what they're registered to
    @projects = policy_scope(Project)
  end

  def show
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
    if @project.save
      # This should sort the policy / viewing issue by adding author of project to project users array - feels kind of sloppy
        # (@project.users << current_user) unless @project.users.include?(current_user)
      (@project.users.uniq - current_user).each do |user|
        # If subscried to email notifications, send email
        ProjectMailer.with(project: @project, user: current_user, author: @project.user).user_added_to_project
      end
      redirect_to project_path(@project)
    else
      render :new
    end
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
