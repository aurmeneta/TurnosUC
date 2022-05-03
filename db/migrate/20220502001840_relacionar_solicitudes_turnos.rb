class RelacionarSolicitudesTurnos < ActiveRecord::Migration[6.0]
  def change

    add_reference :solicituds, :turno

  end
end
