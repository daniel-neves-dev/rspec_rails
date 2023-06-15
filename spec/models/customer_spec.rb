require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :all

  it "#full name" do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it {expect{create(:customer)}.to change{Customer.all.size}.by(1)}

  it "customer vip" do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true )
  end

  it "default customer" do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end
end
