class AddPayTypeIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :pay_type, index: true, foreign_key: true
  end
end
