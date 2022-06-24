module Spree
  module V2
    module Storefront
      class VolumePriceSerializer < BaseSerializer          
        attributes :name, :range, :amount, :position, :discount_type

        belongs_to :variant
      end
    end
  end
end
