require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'customer index page' do
    visit(customers_url)
    expect(page).to have_current_path(customers_url)
  end

  describe 'create costumer' do
    before do
      @member = create(:member)
      login_as(@member, :scope => :member)
    end

    it 'new costumer' do
      visit(new_customer_url)
      fill_in('Name', with: Faker::Name.name)
      fill_in('Address', with: Faker::Address.street_address)
      fill_in('Email', with: Faker::Internet.email)
      click_button('Create Customer')
      expect(page).to have_content("Customer was successfully created.")
    end

    it 'find h1 title' do
      visit(new_customer_url)
      expect(find('h1')).to have_content('New customer')
    end
  end
end
