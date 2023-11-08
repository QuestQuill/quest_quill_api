class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.string :name
      t.string :description
      t.string :goal
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
