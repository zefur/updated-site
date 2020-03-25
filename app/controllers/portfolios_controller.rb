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


  private
  def project_params
    params.require(:project).permit(:title, :description, :image, :github, :thumb, :stack_list)
  end
end
