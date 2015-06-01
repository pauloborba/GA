class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.string :contratado
      t.date :data
      t.decimal :salario

      t.timestamps
    end
  end
end
