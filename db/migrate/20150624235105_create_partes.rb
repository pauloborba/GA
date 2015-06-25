class CreatePartes < ActiveRecord::Migration
  def change
    create_table :partes do |t|
      t.belongs_to :clausula, index: true
      t.belongs_to :contrato, index: true
      t.timestamps null: false
    end
  end
end
