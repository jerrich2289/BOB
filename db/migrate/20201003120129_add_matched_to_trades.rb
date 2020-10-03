class AddMatchedToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :matched, :boolean, :default => false
  end
end
