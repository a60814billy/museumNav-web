class AddTicketCodeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :ticket_auth_code, :string
  end
end
