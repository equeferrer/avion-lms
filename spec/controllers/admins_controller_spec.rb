require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  it { is_expected.to route(:get, '/admins/dashboard').to(action: :dashboard) }
  it { is_expected.to route(:get, '/admins').to(action: :index) }
  it { is_expected.to route(:get, '/admins/1').to(action: :show, id: 1) }
end
