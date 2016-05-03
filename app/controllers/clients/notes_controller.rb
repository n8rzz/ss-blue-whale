class Clients::NotesController < NotesController
  before_action :set_notable

  private

  def set_notable
    @notable = Client.find(params[:client_id])
  end
end
