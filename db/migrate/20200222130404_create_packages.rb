class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :provider
      t.string :name
      t.string :description
      t.integer :price
      t.integer :sort
      t.string :logo

      t.timestamps
    end
  end
end
