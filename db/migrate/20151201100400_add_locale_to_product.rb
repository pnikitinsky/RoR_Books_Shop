class AddLocaleToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :locale, :string
  end
end
