require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  context 'Validates' do
    it { should validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category_id)}
    end

  context 'Associations' do
    it {is_expected.to belong_to(:category)}
  end

  context 'Instance Methods' do
    it 'product with full description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
