class AnadirAdminUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :admin, :boolean, default: false
  end
end
