class ChangeItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :user_id, :item_id
  end
end
