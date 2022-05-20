class PrefixVolumePricingTableNames < ActiveRecord::Migration[6.1]
  def change
    rename_table :volume_prices, :spree_volume_prices unless Spree::VolumePrice.table_exists?
  end
end
