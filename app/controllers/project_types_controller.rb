class ProjectTypesController < ApplicationController
  before_action :set_project_type, only: [:show, :update, :destroy, :add_task_items]

  # GET /projectTypes
  def index
    @project_types = ProjectType.all

    render json: @project_types
  end

  # GET /projectTypes/1
  def show
    render json: @project_type
  end

  # POST /projectTypes
  def create
    @project_type = ProjectType.new(project_type_params)

    if @project_type.save
      render json: @project_type, status: :created, location: @project_type
    else
      render json: @project_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projectTypes/1
  def update
    if @project_type.update(project_type_params)
      render json: @project_type
    else
      render json: @project_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projectTypes/1
  def destroy
    @project_type.destroy
  end

  # POST /projectTypes/:id/taskItems
  def add_task_items
    if @project_type.task_item_ids = project_type_task_items_params
      render json: @project_type
    else
      render json: @project_type.errors
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_type
    @project_type = ProjectType.includes(:task_items).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def project_type_params
    params.require(:project_type).permit(:name, :description, :dueDate, task_item_ids: [])
  end

  def project_type_task_items_params
    params[:task_item_ids]
  end
end
