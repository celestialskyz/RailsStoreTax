class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.float :price, null:false, default:0
      t.boolean :hasBasicTax, default:true
      t.boolean :isImported, default:false

      t.timestamps
    end
  end
end
