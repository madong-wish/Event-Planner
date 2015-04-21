class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.event :name

      t.timestamps
    end
  end
end
