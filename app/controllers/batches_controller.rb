class BatchesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(set_batch)
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      redirect_to batches_path
    else
      render :new
    end
  end

  def edit
    @batch = Batch.find(set_batch)
  end

  def update
    @batch = Batch.find(set_batch)
    if @batch.update(batch_params)
      redirect_to batches_path
    else
      render :edit
    end
  end

  def destroy
    @batch = Batch.find(set_batch)
    @batch.destroy
    # redirect_to root_path
  end

  private

  def set_batch
    params[:id]
  end

  def batch_params
    params.require(:batch).permit(:name, :start_date, :end_date)
  end
end
