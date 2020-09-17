class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.text :description
      t.string :name
      t.integer :size

      t.timestamps
    end
  end
end
