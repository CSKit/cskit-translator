class AddPageAndLineToPhrases < ActiveRecord::Migration
  def change
    remove_column :phrases, :sort_key
    add_column :phrases, :page, :string
  end
end
