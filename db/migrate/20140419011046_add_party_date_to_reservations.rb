class AddPartyDateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :party_date, :datetime
  end
end
