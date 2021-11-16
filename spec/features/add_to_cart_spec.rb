require 'rails_helper'

RSpec.feature "Visitor clicks Add button on a product on home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see My Cart quantity change from 0 to 1" do
    # ACT
    visit root_path

    expect(page).to have_content("My Cart (0)")

    save_screenshot

    click_on(class: 'btn btn-primary', match: :first)
    
    # VERIFY
    expect(page).to have_content("My Cart (1)")

    save_screenshot
  end
end