class CreateTvspecials < ActiveRecord::Migration[5.1]
  def change
    create_table :tvspecials do |t|
      t.string :name
      t.integer :runtime

      t.timestamps
    end
  end
end
