class AddFechaAndComunaToTurnos < ActiveRecord::Migration[6.0]
  def change
    add_column :turnos, :comuna, :string
    add_column :turnos, :fecha, :datetime
  end
end
