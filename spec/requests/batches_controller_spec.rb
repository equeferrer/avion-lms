require 'rails_helper'

RSpec.describe 'BatchesController', type: :request do
  let(:admin) { create(:admin) }
  let(:batch) { create(:batch) }

  before do
    sign_in(admin)
  end

  describe 'GET /batches' do
    it 'views index batches and returns http success' do
      get batches_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /batches/new' do
    it 'gets form for new batch' do
      get batches_new_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /batches' do
    it 'lets admin create new batch' do
      params = { name: 'Test Batch', start_date: '01-01-2021', end_date: '02-01-2021' }
      post batch_create_path, params: { batch: params }
      expect(response).to redirect_to(batches_path)
    end
  end

  describe 'GET /batches/:id' do
    it 'views a specific batch' do
      get batch_show_path(id: batch.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /batches/edit/:id' do
    it 'gives ability to edit a specific batch' do
      get batch_edit_path(id: batch.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /batches/edit/:id' do
    it 'updates edited parameters' do
      get batch_update_path(id: batch.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /batches/:id' do
    it 'deletes a specific batch' do
      delete batch_delete_path(id: batch.id)
      expect { Batch.find(batch.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
