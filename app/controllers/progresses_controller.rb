class ProgressesController < ApplicationController
  before_action :authenticate_student!

  def new
    @progress = Progress.new
  end

  def create
    @progress = Progress.new(progress_params)
    @progress.student_id = current_student.id
    if @progress.save
      redirect_to progress_show_path(@progress)
    else
      render :new
    end
  end

  def show
    @progress = Progress.find(set_progress)
  end

  def edit
    @progress = Progress.find(set_progress)
  end

  def update
    @progress = Progress.find(set_progress)
    if @progress.update(progress_params)
      redirect_to progress_show_path(@progress)
    else
      render :edit
    end
  end

  private

  def set_progress
    params[:id]
  end

  def progress_params
    params.require(:progress).permit(:username, :repo, :passed, :total, :pending)
  end
end
