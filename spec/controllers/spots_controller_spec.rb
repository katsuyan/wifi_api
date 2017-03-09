require 'rails_helper'

RSpec.describe SpotsController, type: :controller do
  describe 'GET #show' do
    describe 'params lat and lng' do
      it "ステータスコードとして200が返ること" do
        get :spots, params: {lat: 0, lng: 0}
        expect(response.status).to eq 200
      end

      it "ステータスコードとして400が返ること" do
        get :spots
        expect(response.status).to eq 400
      end

      it "ステータスコードとして400が返ること" do
        get :spots, params: {lng: 0}
        expect(response.status).to eq 400
      end

      it "ステータスコードとして400が返ること" do
        get :spots, params: {lat: 0}
        expect(response.status).to eq 400
      end
    end
  end
end
