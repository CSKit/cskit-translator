class AddMarginalHeadingFieldToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :marginal_heading, :boolean, :default => false
  end
end
