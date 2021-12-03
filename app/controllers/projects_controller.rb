class ProjectsController < ApplicationController
  def index
    render json: { message: "ok" }
    # @projects = Project.all
  end

  def index
    @projects = Project.all
  end
  
end
