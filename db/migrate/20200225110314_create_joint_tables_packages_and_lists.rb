class CreateJointTablesPackagesAndLists < ActiveRecord::Migration[6.0]
  def change
    create_table :haveLists_packages do |t|
      t.belongs_to :have_list
      t.belongs_to :package
    end

    create_table :wantsLists_packages do |t|
      t.belongs_to :want_list
      t.belongs_to :package
    end

  end
end
