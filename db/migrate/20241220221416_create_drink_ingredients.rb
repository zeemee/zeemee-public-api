class CreateDrinkIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :drink_ingredients do |t|
      t.references :drink, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :measurement

      t.timestamps
    end
  end
end
