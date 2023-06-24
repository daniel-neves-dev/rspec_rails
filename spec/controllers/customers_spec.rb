require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'get/index' do
    get :index
    expect(response).to have_http_status '200'
  end
end
