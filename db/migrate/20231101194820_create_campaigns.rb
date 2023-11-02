class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :player_num
      t.string :themes

      t.timestamps
    end
  end
end
