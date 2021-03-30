require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:lesson) { described_class.new }

  before do
    lesson.title = 'Test Lesson' * 50
    lesson.content = 'Sample Text for Lesson' * 50
  end

  it '1. should not save without title' do
    lesson.title = nil
    lesson.save
    expect(lesson.errors.to_hash.keys).to include(:title)
  end

  it '2. should not save without content' do
    lesson.content = nil
    lesson.save
    expect(lesson.errors.to_hash.keys).to include(:content)
  end
end
