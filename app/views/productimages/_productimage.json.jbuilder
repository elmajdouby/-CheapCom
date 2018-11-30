json.extract! productimage, :id, :alt, :src, :user_id, :product_id, :created_at, :updated_at
json.url productimage_url(productimage, format: :json)
