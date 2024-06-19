class CreateCampaignThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_themes do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
