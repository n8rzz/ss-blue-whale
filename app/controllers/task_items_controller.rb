class TaskItemsController < ApplicationController
  before_action :set_task_item, only: [:show, :update, :destroy, :add_project_types]

  # GET /task_items
  def index
    @task_items = TaskItem.all

    render json: @task_items
  end

  # GET /task_items/1
  def show
    render json: @task_item
  end

  # POST /task_items
  def create
    @task_item = TaskItem.new(task_item_params)

    if @task_item.save
      render json: @task_item, status: :created, location: @task_item
    else
      render json: @task_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_items/1
  def update
    if @task_item.update(task_item_params)
      render json: @task_item
    else
      render json: @task_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_items/1
  def destroy
    @task_item.destroy
  end

  def add_project_types
    if @task_item.project_type_ids = task_item_project_types_params
      render json: @task_item
    else
      render json: @task_item.errors
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task_item
    @task_item = TaskItem.includes(:project_types).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_item_params
    params.require(:task_item).permit(:name, :description, :isControllable, :sortOrder,
                                      :startDate, :endDate, project_type_ids: [])
  end

  def task_item_project_types_params
    params[:project_type_ids]
  end
end
