class AddPhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.column :key, :text, null: false
      t.column :sort_key, :integer, null: false # used to order these strings by page/line/etc
      t.timestamps
    end
  end
end
