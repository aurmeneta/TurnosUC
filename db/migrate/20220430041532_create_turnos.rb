class CreateTurnos < ActiveRecord::Migration[6.0]
  def change
    create_table :turnos do |t|
      t.string :dia
      t.string :direccion_salida
      t.time :hora_salida
      t.string :tipo
      t.integer :cupos
      t.string :campus

      t.timestamps
    end
  end
end
