class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :data
      t.string :location

      t.timestamps
    end
  end
end
