class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :actname
      t.integer :points
      t.integer :day_id
      t.timestamps
    end
  end
end
