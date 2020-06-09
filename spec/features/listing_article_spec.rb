require 'rails_helper'

RSpec.feature "Listing Articles" do
    scenario "A user views all articles on index page" do
        @article1 = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet, consectetur")
        @article2 = Article.create(title: "Second Article", body: "Body of the 2nd article")

        visit "/"

        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)

    end

    scenario "A user has no articles created" do
        @article1 = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet, consectetur")
        @article2 = Article.create(title: "Second Article", body: "Body of the 2nd article")
        
        Article.delete_all

         visit "/"

        expect(page).not_to have_content(@article1.title)
        expect(page).not_to have_content(@article1.body)
        expect(page).not_to have_content(@article2.title)
        expect(page).not_to have_content(@article2.body)
        
        expect(page).not_to have_link(@article1.title)
        expect(page).not_to have_link(@article2.title)

        within ("h1#no-articles") do
            expect(page).to have_content("No Articles Created")
        end
    end
end