class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
