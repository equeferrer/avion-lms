require 'rails_helper'

RSpec.describe 'LessonsController', type: :request do
  let(:admin) { create(:admin) }
  let(:lesson) { create(:lesson) }

  before do
    sign_in(admin)
  end

  describe 'GET /lessons' do
    it 'views index lessons and returns http success' do
      get lessons_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /lessons/new' do
    it 'gets form for new lessons' do
      get lessons_new_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /lessons' do
    it 'lets admin create new lesson' do
      params = { name: 'Test Lesson 2', content: 'Sample content for Test lesson 2' }
      post lesson_create_path, params: { lesson: params }
      expect(response).to redirect_to(lessons_path)
    end
  end

  describe 'GET /lessons/:id' do
    it 'views a specific lesson' do
      get lesson_show_path(id: lesson.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /lessons/edit/:id' do
    it 'gives ability to edit a specific lesson' do
      get lesson_edit_path(id: lesson.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /lessons/edit/:id' do
    it 'updates edited parameters' do
      get lessons_update_path(id: lesson.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /lessons/:id' do
    it 'deletes a specific lesson' do
      delete lessons_delete_path(id: lesson.id)
      expect { Lesson.find(lesson.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
