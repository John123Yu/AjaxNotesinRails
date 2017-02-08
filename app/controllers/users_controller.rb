class UsersController < ApplicationController
  def index
  	@notes = Note.all
  end
  def addNote
  	note = Note.create(note_params)
  	@notes = Note.all
  	respond_to do |format|
	    format.html { render action: "_ajaxnotes" }
	    format.json { render json: @notes, status: :unprocessable_entity }
	    format.js
    end
  end
  def deleteNote
  	Note.where(:id => params[:id]).delete_all
  	@notes = Note.all
  	respond_to do |format|
	    format.html { render action: "_ajaxnotes" }
	    format.json { render json: @notes, status: :unprocessable_entity }
	    format.js
    end
  end
  def editNote
  	Note.update(params[:id], title: params[:title], content: params[:content])
  	@notes = Note.all
  	respond_to do |format|
	    format.html { render action: "_ajaxnotes" }
	    format.json { render json: @notes, status: :unprocessable_entity }
	    format.js
    end
  end
  def note_params
	params.require(:note).permit(:title, :content, :id)
  end
end
