RSpec.describe Spree::LineItem, type: :model do
  before do
    @order = create(:order)
    @variant = create(:variant, price: 10)
    @variant.volume_prices.create! amount: 9, discount_type: 'price', range: '(2+)'
    add_variant_to_order
    @line_item = @order.line_items.first
  end

  def add_variant_to_order
    if Spree.version.to_f < 4.0
      @order.contents.add(@variant, 1)
    else
      Spree::Cart::AddItem.call(order: @order, variant: @variant, quantity: 1)
    end
  end
end
