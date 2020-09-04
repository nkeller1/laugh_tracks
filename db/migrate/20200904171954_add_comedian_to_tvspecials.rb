class AddComedianToTvspecials < ActiveRecord::Migration[5.1]
  def change
    add_column :tvspecials, :comedian_id, :integer
    add_index :tvspecials, :comedian_id
  end
end
