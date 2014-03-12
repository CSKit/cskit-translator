class AddChapterTitleFlag < ActiveRecord::Migration
  def change
    add_column :phrases, :chapter_title, :boolean, default: false
  end
end
