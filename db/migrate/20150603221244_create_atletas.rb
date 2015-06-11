class CreateAtletas < ActiveRecord::Migration
  def change
    create_table :atletas do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :data_nascimento
      t.string :cpf
      t.string :rg
      t.float :altura
      t.float :peso
      t.string :posicao_joga
      t.string :categoria
      t.string :alojamento_clube

      t.timestamps null: false
    end
  end
end
