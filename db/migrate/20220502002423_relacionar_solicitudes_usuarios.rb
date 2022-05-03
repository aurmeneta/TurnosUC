class RelacionarSolicitudesUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :solicituds,:usuario
  end
end
