class CreateGas < ActiveRecord::Migration
  def change
    create_table :gas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
