class Projects::NotesController < NotesController
  before_action :set_notable

  private

  def set_notable
    @notable = Project.find(params[:project_id])
  end
end
