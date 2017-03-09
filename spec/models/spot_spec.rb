require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe 'spot' do
    it "テストのテスト" do
      create(:spot)
      expect(Spot.count).to eq 1
    end
  end
end
