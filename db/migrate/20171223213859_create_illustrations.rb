class CreateIllustrations < ActiveRecord::Migration[5.1]
  def change
    create_table :illustrations do |t|
      t.string :title
      t.string :author
      t.string :source
      t.text :content

      t.timestamps
    end
  end
end
