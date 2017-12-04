class CreateFinishedVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :finished_variants do |t|
      t.integer :test_result_id
      t.integer :variant_id

      t.timestamps
    end
  end
end
