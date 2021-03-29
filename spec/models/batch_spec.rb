require 'rails_helper'

RSpec.describe Batch, type: :model do
  let(:batch) { described_class.new }

  before do
    batch.name = 'Test Batch'
    batch.start_date = '2021-01-01'
    batch.end_date = '2021-02-01'
  end

  it '1. should not save without name' do
    batch.name = nil
    batch.save
    expect(batch.errors.to_hash.keys).to include(:name)
  end

  it '2. should not save without start_date' do
    batch.start_date = nil
    batch.save
    expect(batch.errors.to_hash.keys).to include(:start_date)
  end

  it '3. should not save without end_date' do
    batch.end_date = nil
    batch.save
    expect(batch.errors.to_hash.keys).to include(:end_date)
  end
end
