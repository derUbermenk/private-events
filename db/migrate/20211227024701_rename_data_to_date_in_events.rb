class RenameDataToDateInEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :data, :date
  end
end
