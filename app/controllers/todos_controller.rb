class TodosController < ApplicationController   
  protect_from_forgery prepend: true
  before_action :set_todo, only: [:update]

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @todo.toggle!(:isCompleted)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:text, :isCompleted, :project_id)
  end

  def project_params
    params.fetch(:project, {}).permit(:title, :id)
  end
end
