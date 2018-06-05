class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.integer :priority
      t.string :color
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
