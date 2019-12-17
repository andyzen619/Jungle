require 'rails_helper'
RSpec.feature "AddToCart", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg'),
      )
    end
  end

  scenario "They see cart increase by 1" do
    visit root_path

    # save_screenshot

    first('.actions').click_on('Add')

    # save_screenshot

    expect(page).to have_content("My Cart (1)")
  end
end
