class FixVoteBelongsTo < ActiveRecord::Migration
  def up
    remove_column :votes, :users_id
    remove_column :votes, :translations_id
    change_table :votes do |t|
      t.references :user
      t.references :translation
    end
  end

  def down
    change_table :votes do |t|
      t.references :users
      t.references :translations
    end
    remove_column :votes, :user_id
    remove_column :votes, :translation_id
  end
end
