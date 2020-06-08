require 'rails_helper'

RSpec.feature "Creating Articles" do
    scenario "A user creates a new article" do
        
        visit "/"
        click_link "New Article"

        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam imperdiet eu dui vel porta. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla rhoncus est diam. Pellentesque suscipit leo interdum condimentum hendrerit."

        click_button "Create Article"
        expect(page).to have_content("Article has been created!")
        expect(page.current_path).to eq(articles_path)
    end
end