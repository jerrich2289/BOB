class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.text :message
      t.references :trade, null: false, foreign_key: {to_table: :trades}

      t.timestamps
    end
  end
end
