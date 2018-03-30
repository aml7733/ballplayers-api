class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name_brief
      t.string :first_name
      t.string :last_name
      t.references :position, foreign_key: true
      t.references :sport, foreign_key: true
      t.integer :age
      t.float :average_position_age_diff

      t.timestamps
    end
  end
end
