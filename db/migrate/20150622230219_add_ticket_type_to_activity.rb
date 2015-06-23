class AddTicketTypeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :ticket_type, :boolean
  end
end
