class CreateNotificaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :notificaciones do |t|
      t.string :contenido
      t.boolean :visto, default: false

      t.timestamps
    end

    add_reference :notificaciones, :usuario
    add_reference :notificaciones, :turno
    add_foreign_key :notificaciones, :usuarios, on_delete: :cascade
    add_foreign_key :notificaciones, :turnos, on_delete: :cascade
  end
end
