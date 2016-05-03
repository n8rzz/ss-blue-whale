class TaskItems::NotesController < NotesController
  before_action :set_notable

  private

  def set_notable
    @notable = TaskItem.find(params[:task_item_id])
  end
end
