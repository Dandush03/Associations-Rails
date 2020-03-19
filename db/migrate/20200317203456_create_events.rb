class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.string :location
      t.string :description
      t.references :creator, references: :users, foreign_key: { to_table: :users}
    end
  end
end
