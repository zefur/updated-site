class PortfoliosController < ApplicationController
  layout "portfolio"
  def index
    @project
    params[:languages] ? @projects = Project.tagged_with(params[:language]) : @projects = Project.all
  end
  
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end 
  def update
    @project = Project.find(params[:id])
    
    respond_to do |format|
        if @project.update(portfolio_params)
            format.html {redirect_to projects_path, notice: 'Your item is now live.'}
        else
            format.html {render :edit}
        end
    end
end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
        format.html {redirect_to projects_url, notice: "Item deleted" }
    end
end

  private
  def project_params
    params.require(:project).permit(:title, :description, :main_image, :github, :thumb_image, :stack_list)
  end
end
