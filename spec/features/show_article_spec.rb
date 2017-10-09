require "rails_helper"

RSpec.feature "Showing an article" do
  
  before do
    @article = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.") 
  end
  
  scenario "A user shows an articles" do
    visit "/"
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
  
end