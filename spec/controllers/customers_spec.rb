require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'crud' do

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
      it 'get/show' do
        sign_in @member
        get :show, params: {id: @customer.id}
        expect(response).to have_http_status('200')
      end

      it 'get/create' do
        sign_in @member
        customer_params = attributes_for(:customer)
        expect{
          post :create, params: {customer: customer_params}
        }.to change(Customer, :count).by(1)
      end
    end
  end
end
