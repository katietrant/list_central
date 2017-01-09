class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :product
      t.integer :quantity
      t.references :list

      t.timestamps null: false
    end
  end
end
