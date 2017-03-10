require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe '.getInsideAll' do
    it '500メートル以内(デフォルト)取得' do
      8.times{ create(:spot) }
      expect(Spot.getInsideAll(35.0, 140.0, 500, 100).count).to eq 6
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
      let(:lat2) { 35.0 }
      let(:lng2) { 140.0 }
      it { is_expected.to eq 0 }
    end

    describe '距離が500くらいになること' do
      context 'latだけ動かして' do
        let(:lat2) { 35.0045 }
        let(:lng2) { 140.0 }
        it { is_expected.to eq 500 }
      end

      context 'lngだけ動かして' do
        let(:lat2) { 35.0 }
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

  end
end
