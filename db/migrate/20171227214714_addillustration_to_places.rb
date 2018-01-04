class AddillustrationToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_reference :places, :illustration, foreign_key: true
  end
end
