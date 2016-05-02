class NotesController < ApplicationController
  # POST @notable/:id/notes
  def create
    @note = @notable.notes.new note_params

    if @note.save
      render json: @notable, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
    @note = @notable.notes(params[:id])

    if @note.update(note_params)
      render json: @notable
    else
      render json: @notable.errors, status: :unprocessable_entity
    end
  end

  # DELETE @notable/:id/notes/:id
  def destroy
    @note = Note.find(params[:id])

    @note.destroy
  end

  private

  def note_params
    params.permit(:content)
  end
end
