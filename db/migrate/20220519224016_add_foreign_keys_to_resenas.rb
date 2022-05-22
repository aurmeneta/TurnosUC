class AddForeignKeysToResenas < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :resenas, :usuarios, on_delete: :cascade
    add_foreign_key :resenas, :usuarios, column: :autor_id, on_delete: :cascade
  end
end