class CreateNpcs < ActiveRecord::Migration[7.0]
  def change
    create_table :npcs do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :class
      t.string :description
      t.string :attitude
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
