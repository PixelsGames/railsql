class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.integer :lesson_id

      t.timestamps
    end
  end
end
