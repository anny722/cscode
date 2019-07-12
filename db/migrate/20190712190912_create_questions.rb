class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :subject
      t.boolean :public, default: false
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
