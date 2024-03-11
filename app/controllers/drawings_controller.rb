class DrawingsController < ApplicationController

  def new
    @drawing = Drawing.new
    # authorize @drawing
  end

  def create
    @project = Project.find(params[:project_id])
    @drawing = Drawing.new(drawing_params)
    @drawing.project = @project
    # authorize @drawing
    if @drawing.save
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
    if @drawing.update(drawing_params)
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
    params.require(:drawing).permit(:name, :number, :revision)
  end
end
