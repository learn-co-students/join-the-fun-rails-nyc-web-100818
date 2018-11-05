class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.timestamps null: false
      t.references :taxi
      t.references :passenger 
    end
  end
end
