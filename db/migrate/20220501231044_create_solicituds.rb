class CreateSolicituds < ActiveRecord::Migration[6.0]
  def change
    create_table :solicituds do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
