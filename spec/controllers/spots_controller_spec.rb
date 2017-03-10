require 'rails_helper'

RSpec.describe SpotsController, type: :controller do
  describe 'GET #api' do
    let(:spots) { 10.times{ create(:spot) }}
    let(:lat) { 35.0 }
    let(:lng) {140.0 }
    before { get :api, params: {lat: lat, lng: lng}}

    describe 'ステータスコードが仕様どおり返ること' do
      describe 'ステータスコードとして200が返ること' do
        it 'lat,lngパラメータが存在する' do
          get :api, params: {lat: lat, lng: lng}
          expect(response.status).to eq 200
        end
      end

      describe 'ステータスコードとして400が返ること' do
        it 'lat,lngパラメータが存在しない' do
          get :api
          expect(response.status).to eq 400
        end

        it 'latパラメータが存在しない' do
          get :api, params: {lng: lng}
          expect(response.status).to eq 400
        end

        it 'lngパラメータが存在しない' do
          get :api, params: {lat: lat}
          expect(response.status).to eq 400
        end
      end
    end

    it 'soptsテンプレートをrenderしていること' do
      expect(response).to render_template :api
    end

    it '@spotsにオブジェクトのリストが格納されていること' do
      expect(assigns(:spots).count).to be >= 0
    end
  end
end
