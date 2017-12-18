class AddProductPriceToLineItem < ActiveRecord::Migration[5.1]
  def change
    reversible do |change|
      change.up do
      add_column :line_items, :price, :decimal, :precision => 8, :scale => 2
      LineItem.all.each do |lineitem|
        lineitem.update_attribute :price, lineitem.product.price
      end
      end

      change.down do
        remove_column :line_items, :price
      end
    end
  end
end
