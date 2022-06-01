module Spree::LineItemDecorator
  def copy_price
    super
    return unless variant

    # TODO make it work only when quantity changed
    # ex. changes.keys.include?('quantity')
    if changed?
      vprice = variant.volume_price(quantity, order.user)

      if vprice && vprice <= variant.price
        self.price = vprice and return
      end
    end

    self.price = variant.price if self.price.nil?
  end
end

Spree::LineItem.prepend Spree::LineItemDecorator
