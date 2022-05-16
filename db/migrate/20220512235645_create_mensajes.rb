class CreateMensajes < ActiveRecord::Migration[6.0]
  def change
    create_table :mensajes do |t|
      t.string :contenido

      t.timestamps
    end

    add_reference :mensajes, :usuario
    add_reference :mensajes, :turno
    add_foreign_key :mensajes, :usuarios, on_delete: :cascade
    add_foreign_key :mensajes, :turnos, on_delete: :cascade
  end
end
