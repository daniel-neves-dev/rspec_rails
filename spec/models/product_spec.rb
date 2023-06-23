require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  it 'has no description, is invalid' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end
end
