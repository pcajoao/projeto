json.extract! product, :id, :name, :desc, :cat_id, :created_at, :updated_at
json.url product_url(product, format: :json)
