class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :place
      t.string :location
      t.datetime :used

      t.timestamps
    end
  end
end
