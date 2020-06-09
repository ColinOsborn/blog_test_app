require 'rails_helper'

RSpec.feature "Showing an article" do
    scenario "A user wants to view a specfic article" do
        
        @article1 = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet, consectetur")
        @article2 = Article.create(title: "Second Article", body: "Body of the 2nd article")
        
        visit "/"
        
        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)
        
        click_link @article1.title
        
        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(current_path).to eq(article_path(@article1))
    end
end