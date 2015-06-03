class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.datetime :data_Inicio
      t.datetime :data_Termino
      t.references :atleta, index: true, foreign_key: true
      t.string :contrata
      t.float :valor

      t.timestamps null: false
    end
  end
end
