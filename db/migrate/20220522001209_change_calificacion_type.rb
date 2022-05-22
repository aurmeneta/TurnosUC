class ChangeCalificacionType < ActiveRecord::Migration[6.0]
  def change
    change_column :resenas, :calificacion, :integer
  end
end
