class RenameFovoriteToFavorite < ActiveRecord::Migration[6.1]
  def change
      rename_table :fovorites, :favorites
  end
end
