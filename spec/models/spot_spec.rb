require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe '.getInsideAll' do
    let(:spot_num) { 10 }
    let(:lat) { 35.0 }
    let(:lng) {140.0 }
    let(:spots) { spot_num.times{ create(:spot) }}
    subject { Spot.getInsideAll(lat, lng, distance: distance, limit: limit).count }
    describe '指定した距離の範囲内でspotを取得できること' do
      context '1000km以内' do
        let(:distance) { 100000 }
        let(:limit) { spot_num }
        it { is_expected.to eq 10 }
      end

      context '500m以内' do
        let(:distance) { 500 }
        let(:limit) { spot_num }
        it { is_expected.to eq 8 }
      end

      context '10m以内' do
        let(:distance) { 10 }
        let(:limit) { spot_num }
        it { is_expected.to eq 6 }
      end
    end

    describe '指定したlimit以下の数のspotを取得できること' do
      context 'limit:6でspotが5個取得できること' do
        let(:distance) { 100000 }
        let(:limit) { 6 }
        it { is_expected.to eq 6 }
      end
    end

    describe 'デフォルト値が動作すること' do
      let(:distance) { 500 }
      let(:limit) { spot_num }
      it 'describe:500のデフォルト値が動作すること' do
        expect(Spot.getInsideAll(lat, lng, limit: limit).count).to eq Spot.getInsideAll(lat, lng, distance: 500, limit: limit).count
      end

      it 'limit:5のデフォルト値が動作すること' do
        expect(Spot.getInsideAll(lat, lng, limit: 5).count).to eq Spot.getInsideAll(lat, lng).count
      end
    end

    it '値取得後それぞれのオブジェクトのdistanceがnilでないこと' do
      expect(Spot.getInsideAll(lat, lng).first.distance).not_to be_nil
    end
  end


  describe '.radians' do
    it 'ラジアンの180がMath::PIであること' do
      expect(Spot.__send__(:radians, 180)).to eq Math::PI
    end
  end


  describe '.move' do
    let(:lat) { 35.0 }
    let(:lng) { 140.0 }
    let(:distance) { 500 }
    let(:move) { Spot.__send__(:move, lat, lng, distance, direction) }
    describe '0度方向(北)への移動' do
      let(:direction) { 0 }
      it 'lngは変化しないこと' do
        expect(move[:lng]).to eq lng
      end

      it 'latが増加すること' do
        expect(move[:lat]).to be > lat
      end
    end

    describe '180度方向(北)への移動' do
      let(:direction) { 180 }
      it 'lngは変化しないこと' do
        expect(move[:lng]).to eq lng
      end

      it 'latが減少すること' do
        expect(move[:lat]).to be < lat
      end
    end

    describe '90度方向(北)への移動' do
      let(:direction) { 90 }
      it 'latは変化しないこと' do
        expect(move[:lat]).to eq lat
      end

      it 'lngが増加すること' do
        expect(move[:lng]).to be > lng
      end
    end

    describe '270度方向(北)への移動' do
      let(:direction) { 270 }
      it 'latは変化しないこと' do
        expect(move[:lat]).to eq lat
      end

      it 'lngが減少すること' do
        expect(move[:lng]).to be < lng
      end
    end
  end


  describe '.getDistance' do
    let(:lat1) { 35.0 }
    let(:lng1) { 140.0 }
    subject { Spot.__send__(:getDistance, lat1, lng1, lat2, lng2).to_i }
    context '距離が0くらいになること' do
      let(:lat2) { lat1 }
      let(:lng2) { lng1 }
      it { is_expected.to eq 0 }
    end

    describe '距離が500くらいになること' do
      context 'latだけ動かして' do
        let(:lat2) { 35.0045 }
        let(:lng2) { lng1 }
        it { is_expected.to eq 500 }
      end

      context 'lngだけ動かして' do
        let(:lat2) { lat1 }
        let(:lng2) { 140.00549 }
        it { is_expected.to eq 500 }
      end

      context 'lat,lngを動かして' do
        let(:lat2) { 35.00351 }
        let(:lng2) { 140.00343 }
        it { is_expected.to eq 500 }
      end
    end
  end


  describe '.getRange' do
    let(:lat) { 35 }
    let(:lng) { 140 }
    let(:range_hash) { {max_lat: max_lat, min_lat: min_lat, max_lng: max_lng, min_lng: min_lng} }
    subject { Hash[Spot.__send__(:getRange, lat, lng, distance).map {|k,v| [k, v.round(8)] }] }
    context 'max,min_lat max,min_lng がそれぞれlat,lngと同じになること' do
      let(:distance) { 0 }
      let(:max_lat) { lat }
      let(:min_lat) { lat }
      let(:max_lng) { lng }
      let(:min_lng) { lng }
      it { is_expected.to match(range_hash) }
    end

    context '500メートル離れた場合の範囲になること' do
      let(:distance) { 500 }
      let(:max_lat) { 35.00449157 }
      let(:min_lat) { 34.99550843 }
      let(:max_lng) { 140.00548319 }
      let(:min_lng) { 139.99451681 }
      it { is_expected.to match(range_hash) }
    end
  end
end
