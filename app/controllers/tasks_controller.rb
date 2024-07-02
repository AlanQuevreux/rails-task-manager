class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # lire toutes les taches
  def index
    @tasks = Task.all
  end

  # Lire une tache grace a l'id
  def show
  end

  # ajouter une nouvelle tache
  def new
    @task = Task.new
  end

  # lors de la création dans le form
  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/tasks/create.html.erb
  redirect_to task_path(@task)
  end

  # editer une tacher
  def edit
  end

  def update
    if @task.update(task_params)
      # No need for app/views/tasks/update.html.erb
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  # supprimer une tache
  def destroy
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
