class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.references :activity
      t.string :nae
      t.string :pic
      t.string :src
      t.timestamps null: false
    end
  end
end
