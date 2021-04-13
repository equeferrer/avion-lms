require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  it { is_expected.to route(:get, 'dashboard').to(action: :dashboard) }
  it { is_expected.to route(:get, '/students').to(action: :index) }
  it { is_expected.to route(:get, '/students/1').to(action: :show, id: 1) }
end
