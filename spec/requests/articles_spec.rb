require 'rails_helper'

RSpec.describe "Articles", type: :request do
  
  before do
    @articles = Article.create(title: "Title one", body: "Body of article one")
  end
  
  describe 'GET /article/:id' do
    context 'with existing article' do
      before { get "/articles/#{@articles.id}" }
      
      it "handles existing articles" do
        expect(response.status).to eq 200
      end
    end
    
    context 'with non-existing articles' do
      before { get "/articles/xxxx" }
      
      it "handles non-existing articles" do
        expect(response.status).to eq 302
        flash_message = "The articles you are looking for could snot be found"
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
  
end