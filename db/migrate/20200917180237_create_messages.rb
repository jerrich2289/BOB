class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user_id, null: false, foreign_key: true
      t.text :message
      t.references :trade_it, null: false, foreign_key: true
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
