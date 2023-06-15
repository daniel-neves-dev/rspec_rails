require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :all

  it("Creat a Customer") {
    cust = customers(:jackson)
    expect(cust.full_name).to eq("Sr. Jackson Pires")
  }
end
