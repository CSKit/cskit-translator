class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :phrases
      t.string :locale
      t.text :translation
      t.timestamps
    end
  end
end
