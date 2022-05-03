class RelacionTurnosUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :turnos, :usuario, foreign_key: true
  end
end
