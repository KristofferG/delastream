class ChangeTypeOfAvailable3 < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :available, :integer
  end
end
