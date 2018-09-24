class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.float :latitude, null: false
      t.float :longtitude, null: false
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
