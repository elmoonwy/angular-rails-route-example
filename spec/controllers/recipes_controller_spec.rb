require 'spec_helper'

describe RecipesController do
  #render_views
  describe "index" do
    before do
      Recipe.create!(name: 'Baked Potato w/ Cheese')
      Recipe.create!(name: 'Garlic Mashed Potatoes')
      Recipe.create!(name: 'Potatoes Au Gratin')
      Recipe.create!(name: 'Baked Brussel Sprouts')

    end

    it "get json data from json" do
      xhr :get, :index, format: :json, keywords: keywords
      response.should be_success
    end

    subject(:result){JSON.parse(response.body)}

    def extract_time
      ->(object){object["name"]}
    end

    context "when the search find results" do
      let(:keywords){'baked'}
      it 'should 200' do
        expect(response.status).to eq(200)
      end

      it 'should return two results' do
        expect(results.size).to eq(2)
      end

      it 'should include backed Potato w/ Cheese' do
        expect(results.map(&extract_name)).to include('Baked Potato w/ Cheese')
      end
    end
  end
end
