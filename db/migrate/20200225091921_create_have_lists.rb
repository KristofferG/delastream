class CreateHaveLists < ActiveRecord::Migration[6.0]
  def change
    create_table :have_lists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
