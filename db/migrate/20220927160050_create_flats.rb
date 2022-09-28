class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :location
      t.decimal :price
      t.string :description
      t.integer :capacity
      t.string :category

      t.timestamps
    end
  end
end
