class AddAdminToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :admin, :booleon, default: true
  end
end
