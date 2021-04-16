class StudentsController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_student!, only: [:dashboard]
  def index
    @students = Student.all
  end

  def show
    @student = current_student
  end

  def dashboard
    @student = current_student
  end
end
