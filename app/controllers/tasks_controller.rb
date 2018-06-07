class TasksController < ApplicationController
  before_action :set_list
  before_action :set_tasks

  def index
    binding.pry
    @tasks = @list.tasks
  end

  def show
  end

  def new
    @task = @list.tasks.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @task = @list.tasks.new(task_params)

    if @taks.save
      redirect_to [@list, @task]
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to [@list, @task]
    else
      redirect_to :form
    end
  end

  def destroy
    @task.destroy
    redirect_to [@list]
  end

  private

  def set_list
    # binding.pry
    @list = List.find(params[:list_id])
  end

  def set_tasks
    # binding.pry
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:body, :priority)
  end
end
