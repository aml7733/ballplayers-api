class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :title
      t.float :avg_age
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
