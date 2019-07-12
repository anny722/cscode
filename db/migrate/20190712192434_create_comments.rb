class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :tab, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
