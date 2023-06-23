require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :all

  it "#full name" do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it {expect{create(:customer)}.to change{Customer.all.size}.by(1)}

  it "male customer vip" do
    customer = create(:customer_male_vip)
    expect(customer.vip).to eq(true )
    expect(customer.gender).to eq("M")
  end

  it "female customer" do
    customer = create(:customer_female)
    expect(customer.gender).to eq("F")
  end

  it "female default customer" do
    customer = create(:customer_female_default)
    expect(customer.vip).to eq(false)
    expect(customer.gender).to eq("F")
  end
  it "transient" do
    customer = create(:customer_default, upcase: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it "attributes_for" do
    puts attributes_for(:customer)
  end
end
