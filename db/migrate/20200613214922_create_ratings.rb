class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :stop_point
      t.float :average
      t.integer :bath
      t.integer :gas_price
      t.integer :security
      t.integer :food
      t.integer :parking

      t.timestamps
    end
  end
end
