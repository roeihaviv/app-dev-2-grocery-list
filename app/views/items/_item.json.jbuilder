json.extract! item, :id, :name, :category, :status, :picture, :amount, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
