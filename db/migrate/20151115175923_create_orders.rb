class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :addres
      t.string :email
      t.string :pay_type

      t.timestamps null: false
    end
  end
end
