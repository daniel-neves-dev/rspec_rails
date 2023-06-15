require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :all

  it "Creat a Customer" do
    customer = create(:customer)
    expect(customer.full_name).to eq("Sr. Jackson Pires")
    end
end
