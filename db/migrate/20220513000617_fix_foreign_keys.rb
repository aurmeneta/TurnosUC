class FixForeignKeys < ActiveRecord::Migration[6.0]
  def change

    remove_foreign_key :solicituds, :turnos
    remove_foreign_key :solicituds, :usuarios
    add_foreign_key :solicituds, :turnos, on_delete: :cascade
    add_foreign_key :solicituds, :usuarios, on_delete: :cascade

    remove_foreign_key :turnos, :usuarios
    add_foreign_key :turnos, :usuarios, on_delete: :cascade
  end
end
