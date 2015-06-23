class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :activity
      t.string :ticket_code
      t.string :ticket_authentication_code
      t.timestamps null: false
    end
  end
end
