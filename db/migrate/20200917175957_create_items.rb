class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :owner_id, null: false, foreign_key: true
      t.text :description
      t.string :name
      t.integer :size

      t.timestamps
    end
  end
end
