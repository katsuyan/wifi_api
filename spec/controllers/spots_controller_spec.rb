require 'rails_helper'

RSpec.describe SpotsController, type: :controller do
  describe 'GET #show' do
    describe 'ステータスコードとして200が返ること' do
      it 'lat,lngパラメータが存在する' do
        get :spots, params: {lat: 0, lng: 0}
        expect(response.status).to eq 200
      end
    end

    describe 'ステータスコードとして400が返ること' do
      it 'lat,lngパラメータが存在しない' do
        get :spots
        expect(response.status).to eq 400
      end

      it 'latパラメータが存在しない' do
        get :spots, params: {lng: 0}
        expect(response.status).to eq 400
      end

      it 'lngパラメータが存在しない' do
        get :spots, params: {lat: 0}
        expect(response.status).to eq 400
      end
    end
  end
end
