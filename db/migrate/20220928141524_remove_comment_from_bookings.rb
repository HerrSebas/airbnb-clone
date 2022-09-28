class RemoveCommentFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :comment, :string
  end
end
