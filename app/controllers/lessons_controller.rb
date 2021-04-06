class LessonsController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(set_lesson)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(set_lesson)
  end

  def update
    @lesson = Lesson.find(set_lesson)
    if @lesson.update(lesson_params)
      redirect_to lessons_path
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(set_lesson)
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def set_lesson
    params[:id]
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
end
