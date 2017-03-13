require 'rails_helper'

RSpec.describe SpotsController, type: :controller do
  describe 'GET #api' do
    let(:lat) { 35.0 }
    let(:lng) {140.0 }

    describe 'ステータスコードが仕様どおり返ること' do
      describe 'ステータスコードとして200が返ること' do
        it 'lat,lngパラメータが存在する' do
          get :api, params: {lat: lat, lng: lng}
          expect(response.status).to eq 200
        end

        it 'searchパラメータが存在する' do
          get :api, params: {word: 'name'}
          expect(response.status).to eq 200
        end

        it 'lat,lng,searchパラメータが存在する' do
          get :api, params: {lat: lat, lng: lng, word: 'name'}
          expect(response.status).to eq 200
        end
      end

      describe 'ステータスコードとして400が返ること' do
        it 'lat,lng,wordパラメータが存在しない' do
          get :api
          expect(response.status).to eq 400
        end

        it 'lat,wordパラメータが存在しない' do
          get :api, params: {lng: lng}
          expect(response.status).to eq 400
        end

        it 'lng,wordパラメータが存在しない' do
          get :api, params: {lat: lat}
          expect(response.status).to eq 400
        end
      end
    end

    it 'soptsテンプレートをrenderしていること' do
      get :api, params: {lat: lat, lng: lng}
      expect(response).to render_template :api
    end

    it '@spotsにオブジェクトのリストが格納されていること' do
      get :api, params: {lat: lat, lng: lng}
      expect(assigns(:spots).count).to be >= 0
    end

    describe 'テンプレートが反映されていること' do
      render_views

      it 'lat,lngパラメータが存在する' do
        get :api, params: {lat: lat, lng: lng}
        json = JSON.parse(response.body)
        expect(json['spots'][0]).to be_has_key('name')
        expect(json['spots'][0]).to be_has_key('address')
        expect(json['spots'][0]).to be_has_key('distance')
      end

      it 'wordパラメータが存在する' do
        get :api, params: {word: 'name'}
        json = JSON.parse(response.body)
        expect(json['spots'][0]).to be_has_key('name')
        expect(json['spots'][0]).to be_has_key('address')
        expect(json['spots'][0]).to be_has_key('distance')
      end

      it 'lat,lng,wordパラメータが存在する' do
        get :api, params: {lat: lat, lng: lng, word: 'name'}
        json = JSON.parse(response.body)
        expect(json['spots'][0]).to be_has_key('name')
        expect(json['spots'][0]).to be_has_key('address')
        expect(json['spots'][0]).to be_has_key('distance')
      end
    end
  end
end
