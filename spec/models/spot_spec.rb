require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe 'spot' do
    it "テストのテスト" do
      8.times{ create(:spot) }
      expect(Spot.count).to eq 8
    end
  end
end
