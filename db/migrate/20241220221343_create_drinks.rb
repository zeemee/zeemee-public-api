class CreateDrinks < ActiveRecord::Migration[7.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :container, null: false, foreign_key: true
      t.text :instructions
      t.string :image

      t.timestamps
    end
  end
end
