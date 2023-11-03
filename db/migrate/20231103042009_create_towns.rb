class CreateTowns < ActiveRecord::Migration[7.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.text :description
      t.string :leadership
      t.string :taverns
      t.string :shops
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
