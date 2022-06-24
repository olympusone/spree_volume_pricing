module Spree::V2::Storefront::VariantSerializerDecorator
  def self.prepended(base)
    base.has_many :volume_prices
  end
end

::Spree::V2::Storefront::VariantSerializer.prepend(Spree::V2::Storefront::VariantSerializerDecorator)