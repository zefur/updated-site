class PortfoliosController < ApplicationController
  def index
    @project = Project.all
  end
  def new

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
