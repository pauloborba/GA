class CreateClausulas < ActiveRecord::Migration
  def change
    create_table :clausulas do |t|
      t.string :titulo
      t.string :descricao

      t.timestamps null: false
    end
  end
end
