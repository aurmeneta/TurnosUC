class SetImagenPerfilNullable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :usuarios, :imagen_perfil, true
  end
end
