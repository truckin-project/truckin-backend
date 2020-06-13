class CreateStopPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :stop_points do |t|
      t.string :name

      t.timestamps
    end
  end
end
