class ChangeTypeOfAvailable < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :available, :integer
  end
end
