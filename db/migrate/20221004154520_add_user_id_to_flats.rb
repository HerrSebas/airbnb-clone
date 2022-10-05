class AddUserIdToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :user_id, :integer
  end
end
