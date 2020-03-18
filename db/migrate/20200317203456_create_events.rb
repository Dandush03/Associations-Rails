class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.string :location
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
