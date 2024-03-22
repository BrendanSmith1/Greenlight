class DrawingsController < ApplicationController
  before_action :set_paper_trail_whodunnit

  def new
    @drawing = Drawing.new
    # authorize @drawing
  end

  def create
    @project = Project.find(params[:project_id])
    @drawing = Drawing.new(drawing_params)
    @drawing.project = @project
    @drawing.file.attach(params[:file])
    # authorize @drawing
    if @drawing.save
      # (@project.users.uniq - current_user).each do |user|
      #   # If subscried to email notifications, send email
      #   ProjectMailer.with(project: @project, user: current_user, author: @project.user, drawing: @drawing).drawing_added_to_project
      # end
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @drawing = Drawing.find(params[:id])
    # authorize @drawing
  end

  def update
    @drawing = Drawing.find(params[:id])
    @drawing.file.attach(params[:file])
    if @drawing.update(drawing_params)
      # (@project.users.uniq - current_user).each do |user|
      #   # If subscried to email notifications, send email
      #   ProjectMailer.with(project: @project, user: current_user, author: @project.user, drawing: @drawing).drawing_updated_on_project
      # end
      redirect_to project_path(@drawing.project)
    else
      render :edit
    end
  end

  def destroy
    @drawing = Drawing.find(params[:id])
    @drawing.destroy
    redirect_to project_path(@drawing.project)
  end

  private

  def drawing_params
    params.require(:drawing).permit(:name, :number, :revision, :file)
  end
end
