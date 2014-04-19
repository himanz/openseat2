class RemovePartyDateFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :party_date, :datetime
  end
end
