class ChangeClassToKlassInNpcs < ActiveRecord::Migration[7.0]
  def change
    rename_column :npcs, :class, :klass
  end
end
