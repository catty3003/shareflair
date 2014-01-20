json.array!(@products) do |product|
  json.extract! product, :id, :title, :category, :target_group, :size, :color, :price, :duration, :description, :user_id
  json.url product_url(product, format: :json)
end
