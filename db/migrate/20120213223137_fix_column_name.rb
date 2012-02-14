class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :profiles, :keyword, :keywords
  end

  def down
  end
end
