require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'crud' do

    context 'routes' do
      it { is_expected.to route(:get, '/customers').to(action: :index) }
    end

    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    context 'as a guest' do
      it 'get/index' do
        get :index
        expect(response).to have_http_status '200'
      end

      it 'get/show, not authorized' do
        get :show, params: {id: @customer.id}
        expect(response).to have_http_status '302'
      end
    end

    context 'as a member logged in' do

      before do
        sign_in @member
      end

      it 'content type JSON' do
        customer_params = attributes_for(:customer)
        post :create, format: :json, params: {customer: customer_params}
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'flash notice' do
        customer_params = attributes_for(:customer)
        post :create, params: {customer: customer_params}
        expect(flash[:notice]).to match(/successfully create/)
      end

      it 'get/show' do
        get :show, params: {id: @customer.id}
        expect(response).to have_http_status('200')
      end

      it 'get/create' do
        customer_params = attributes_for(:customer)
        expect{
          post :create, params: {customer: customer_params}
        }.to change(Customer, :count).by(1)
      end
    end
  end
end
