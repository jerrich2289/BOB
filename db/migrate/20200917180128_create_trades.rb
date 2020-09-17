class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.references :item_1, null: false, foreign_key: {to_table: :items}
      t.references :item_2, null: false, foreign_key: {to_table: :items}
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
