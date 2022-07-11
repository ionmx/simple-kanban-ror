class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    col = Column.find(params["column_id"])
    @task = col.tasks.new(task_params)
    if @task.save
      render json: { data: @task }, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: { data: @task }
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  def move_task
    @task = Task.find(params[:task])

    # Update source positions
    Task.where("column_id = ? AND position > ?", @task.column_id, @task.position)
                .update_all("position = position - 1")

    # Update destination positions
    Task.where("column_id = ? AND position >= ?", params["destination"], params["position"])
                .update_all("position = position + 1")

    # Update task
    @task.column_id = params["destination"]
    @task.position = params["position"]
    @task.save
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description, :position, :column_id)
  end
end
