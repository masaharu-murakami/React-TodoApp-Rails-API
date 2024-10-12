class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    Task.create(task_params)
    head :created
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    head :ok
  end

  private

  def task_params
    params.permit(:name, :is_done)
  end
end
