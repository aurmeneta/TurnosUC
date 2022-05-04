class SolicitudLlavesForaneas < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :solicituds, :usuarios
    add_foreign_key :solicituds, :turnos
  end
end
