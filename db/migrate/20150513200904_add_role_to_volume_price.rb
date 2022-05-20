class AddRoleToVolumePrice < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_volume_prices, :role_id, :integer
  end
end
