class ChangePhraseidColumnInTranslations < ActiveRecord::Migration
  def change
    rename_column :translations, :phrases_id, :phrase_id
  end
end
