module Spree::LineItemDecorator
  def self.prepended(base)
    old_copy_price = base.instance_method(:copy_price)

    define_method(:copy_price) do
      old_copy_price.bind(self).call
      return unless variant

      if changed?
        vprice = variant.volume_price(quantity, order.user)

        if self.price? && vprice <= variant.price
          self.price = vprice and return
        end
      end

      self.price = variant.price if self.price.nil?
    end
  end
end

Spree::LineItem.prepend Spree::LineItemDecorator
