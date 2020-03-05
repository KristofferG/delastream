class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.boolean :available
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
