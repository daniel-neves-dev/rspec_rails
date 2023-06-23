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

  it 'has no price, is invalid' do
    product =  build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it 'has no category, is invalid' do
    product = build(:product, category_id: nil)
    product.valid?
    expect(product.errors[:category_id]).to include("can't be blank")
  end

  it 'product with full description' do
    product = create(:product)
    expect(product.full_description).to eq("#{product.description} - #{product.price}")
  end
end
