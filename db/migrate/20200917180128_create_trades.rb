class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.references :item_1_id, null: false, foreign_key: true
      t.references :item_2_id, null: false, foreign_key: true
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
