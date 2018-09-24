class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status, default: 'UNASSIGN'
      t.float :distance, null: true
      
      t.timestamps
    end
  end
end
