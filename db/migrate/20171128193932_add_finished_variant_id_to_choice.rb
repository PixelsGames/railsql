class AddFinishedVariantIdToChoice < ActiveRecord::Migration[5.1]
  def change
    add_column :choices, :finished_variant_id, :integer
  end
end
