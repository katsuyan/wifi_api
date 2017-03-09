require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe 'spot' do
    it "radians" do
      expect(Spot.__send__(:radians, 180)).to eq 3.141592653589793
    end

    it "500メートル以内(デフォルト)取得" do
      8.times{ create(:spot) }
      expect(Spot.getInsideAll(35.0, 140.0, 500, 100).count).to eq 6
    end
  end
end
