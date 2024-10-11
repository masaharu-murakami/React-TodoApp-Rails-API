class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    Task.create(task_params)
    head :created
  end

  private

  def task_params
    params.permit(:name, :is_done)
  end
end
