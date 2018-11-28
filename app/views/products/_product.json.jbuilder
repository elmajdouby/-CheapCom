json.extract! product, :id, :name, :thumb, :description, :user_id, :producttype_id, :created_at, :updated_at
json.url product_url(product, format: :json)
