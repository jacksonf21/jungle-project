require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product details ", type: :feature, js: true do
  before :each do
    @category = Category.create! name: "Apparel"

    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "" do
    visit root_path

    find('.product .pull-right').click
    
    expect(page).to have_css 'article.product-detail'
    save_screenshot
  end
end
