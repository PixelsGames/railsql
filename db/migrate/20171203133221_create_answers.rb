class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :choice_id
      t.integer :finished_variant_id

      t.timestamps
    end
  end
end
