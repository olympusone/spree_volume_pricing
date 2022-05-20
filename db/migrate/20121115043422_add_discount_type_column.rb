class AddDiscountTypeColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_volume_prices, :discount_type, :string
  end
end
