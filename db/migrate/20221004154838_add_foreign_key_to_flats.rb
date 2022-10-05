class AddForeignKeyToFlats < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :flats, :users
  end
end
