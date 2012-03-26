class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock
      t.integer :delivery
      t.integer :return
      t.integer :sold

      t.timestamps
    end
  end
end
