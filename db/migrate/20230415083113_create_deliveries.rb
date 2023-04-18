class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postno,                  null:false
      t.integer :area_id,                null:false
      t.string :cities,                  null:false
      t.string :address,                 null:false
      t.string :building,                null:false
      t.string :tel
      t.references :buy,null: false, foreign_key: true
      t.timestamps
    end
  end
end
