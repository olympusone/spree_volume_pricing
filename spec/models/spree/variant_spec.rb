RSpec.describe Spree::Variant, type: :model do
  it { is_expected.to have_many(:volume_prices) }

  describe '#volume_price' do

    context 'discount_type = price' do
      before :each do
        @variant = create :variant, price: 10
        @variant.volume_prices.create! amount: 9, discount_type: 'price', range: '(10+)'
      end

      it 'uses the variants price when it does not match a range' do
        expect(@variant.volume_price(1).to_f).to be(10.00)
      end

      it 'uses the volume price when it does match a range' do
        expect(@variant.volume_price(10).to_f).to be(9.00)
      end

      it 'uses the volume price when it does match from a volume price model' do
        @variant.volume_price_models << create(:volume_price_model)
        @variant.volume_price_models.first.volume_prices.create!(amount: 5, discount_type: 'price', range: '(5+)')
        expect(@variant.volume_price(6).to_f).to be(5.00)
      end

      it 'gives zero percent earning if doesnt match' do
        expect(@variant.volume_price_earning_percent(1)).to be(0)
      end

      it 'gives zero earning amount if doesnt match' do
        expect(@variant.volume_price_earning_amount(1)).to eq(0)
      end
    end

    context 'discount_type = dollar' do
      before :each do
        @variant = create :variant, price: 10
        @variant.volume_prices.create! amount: 1, discount_type: 'dollar', range: '(10+)'
      end

      it 'uses the variants price when it does not match a range' do
        expect(@variant.volume_price(1).to_f).to be(10.00)
      end

      it 'uses the volume price when it does match a range' do
        expect(@variant.volume_price(10).to_f).to be(9.00)
      end

      it 'uses the volume price when it does match from a volume price model' do
        @variant.volume_price_models << create(:volume_price_model)
        @variant.volume_price_models.first.volume_prices.create!(amount: 5, discount_type: 'dollar', range: '(5+)')
        expect(@variant.volume_price(6).to_f).to be(5.00)
      end

      it 'gives zero percent earning if doesnt match' do
        expect(@variant.volume_price_earning_percent(1)).to be(0)
      end

      it 'gives zero earning amount if doesnt match' do
        expect(@variant.volume_price_earning_amount(1)).to eq(0)
      end
    end

    context 'discount_type = percent' do
      before :each do
        @variant = create :variant, price: 10
        @variant.volume_prices.create! amount: 0.1, discount_type: 'percent', range: '(10+)'
      end

      it 'uses the variants price when it does not match a range' do
        expect(@variant.volume_price(1).to_f).to be(10.00)
      end

      it 'uses the volume price when it does match a range' do
        expect(@variant.volume_price(10).to_f).to be(9.00)
      end

      it 'gives zero percent earning if doesnt match' do
        expect(@variant.volume_price_earning_percent(1)).to be(0)
      end

      it 'uses the volume price when it does match from a volume price model' do
        @variant.volume_price_models << create(:volume_price_model)
        @variant.volume_price_models.first.volume_prices.create!(amount: 0.5, discount_type: 'percent', range: '(5+)')
        expect(@variant.volume_price(6).to_f).to be(5.00)
      end

      it 'gives zero earning amount if doesnt match' do
        expect(@variant.volume_price_earning_amount(1)).to eq(0)
      end
    end
  end
end
