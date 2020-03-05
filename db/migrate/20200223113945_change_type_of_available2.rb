class ChangeTypeOfAvailable2 < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :available, :string
  end
end
