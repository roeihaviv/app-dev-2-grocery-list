class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :category
      t.string :status, default: "stock"
      t.string :picture
      t.integer :amount
      t.integer :user_id, default: "1"

      t.timestamps
    end
  end
end
