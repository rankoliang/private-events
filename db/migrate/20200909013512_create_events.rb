class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.string :title
      t.text :description
      t.references :creator, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
