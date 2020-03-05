class ChangeHaveListsPackagesToHaveListsPackages < ActiveRecord::Migration[6.0]
  def change
    rename_table :haveLists_packages, :have_lists_packages
  end
end
