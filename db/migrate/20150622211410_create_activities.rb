class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :admin_id
      t.string :pic
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
