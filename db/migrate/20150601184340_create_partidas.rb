class CreatePartidas < ActiveRecord::Migration
  def change
    create_table :partidas do |t|
      t.string :nome
      t.string :tag
      t.datetime :data

      t.timestamps null: false
    end
  end
end
