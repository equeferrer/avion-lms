class ProgressesController < ApplicationController
  before_action :authenticate_student!

  def new
    @progress = Progress.new
  end

  def create
    @progress = Progress.new(progress_params)
    @progress.student_id = current_student.id
    if @progress.save
      latest_workflow_id
      jobs_status
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
      latest_workflow_id
      jobs_status
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

  def latest_workflow_id
    username = current_student.progress.username
    repo = current_student.progress.repo
    url = "https://api.github.com/repos/#{username}/#{repo}/actions/runs"
    response = Faraday.get(url)
    parsed = JSON.parse(response.body)
    current_student.progress.workflow_id = parsed['workflow_runs'][0]['id']
    current_student.progress.save
  end

  def jobs_status
    username = current_student.progress.username
    repo = current_student.progress.repo
    id = current_student.progress.workflow_id
    url = "https://api.github.com/repos/#{username}/#{repo}/actions/runs/#{id}/jobs"
    response = Faraday.get(url)
    parsed = JSON.parse(response.body)
    passed = []
    failed = []

    parsed['jobs'][0]['steps'].each do |step|
      if step['status'] == 'completed' && step['conclusion'] == 'success'
        passed << step['name']
      else
        failed << step['name']
      end
      current_student.progress.passed = passed.count - 6
      current_student.progress.pending = failed.join('; ')
      current_student.progress.total = failed.count + passed.count - 6
    end
    current_student.progress.save
  end
end
