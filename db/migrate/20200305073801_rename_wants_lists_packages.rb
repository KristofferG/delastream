class RenameWantsListsPackages < ActiveRecord::Migration[6.0]
  def change
    rename_table :wantsLists_packages, :packages_wants_lists
  end
end
