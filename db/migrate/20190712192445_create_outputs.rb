class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.text :output
      t.references :tab, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
