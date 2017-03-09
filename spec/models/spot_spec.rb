require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe '.getInsideAll' do
    it "500メートル以内(デフォルト)取得" do
      8.times{ create(:spot) }
      expect(Spot.getInsideAll(35.0, 140.0, 500, 100).count).to eq 6
    end
  end

  describe '.radians' do
    it "ラジアンの180がMath::PIであること" do
      expect(Spot.__send__(:radians, 180)).to eq Math::PI
    end
  end

  describe '.move' do

  end

  describe '.getDistance' do

  end

  describe '.getRange' do

  end
end
