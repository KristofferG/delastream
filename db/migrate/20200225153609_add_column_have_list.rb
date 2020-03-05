class AddColumnHaveList < ActiveRecord::Migration[6.0]
  def change

    add_column :have_lists, :comment, :string

  end
end
