class CreateVolumePrices < ActiveRecord::Migration[6.1]
  def self.up
    create_table "spree_variants_volume_price_models", id: :serial, force: :cascade do |t|
      t.bigint "volume_price_model_id"
      t.bigint "variant_id"
      t.index ["variant_id"], name: "index_svvpm_on_variant_id"
      t.index ["volume_price_model_id"], name: "index_svvpm_on_volume_price_model_id"
    end
  
    create_table "spree_volume_price_models", id: :serial, force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "spree_volume_prices", id: :serial, force: :cascade do |t|
      t.bigint "variant_id"
      t.string "name"
      t.string "range"
      t.decimal "amount", precision: 8, scale: 2
      t.integer "position"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "discount_type"
      t.bigint "volume_price_model_id"
      t.index ["variant_id"], name: "index_spree_volume_prices_on_variant_id"
      t.index ["volume_price_model_id"], name: "index_spree_volume_prices_on_volume_price_model_id"
    end
  end

  def self.down
    drop_table :spree_variants_volume_price_models
    drop_table :spree_volume_price_models
    drop_table :spree_volume_prices
  end
end
