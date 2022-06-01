module Spree
    module V2
        module Storefront
            class VolumePriceSerializer < BaseSerializer
                include ::Spree::Api::V2::DisplayMoneyHelper

                attributes :name, :range, :amount, :position, :discount_type

                belongs_to :variant, touch: true, optional: true
            end
        end
    end
end
