class RemoveThemesFromCampaign < ActiveRecord::Migration[7.0]
  def change
    remove_column :campaigns, :themes, :string
  end
end
