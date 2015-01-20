json.array!(@orders) do |order|
  json.extract! order, :id, :gas, :price, :amount, :sum, :operator_id
  json.url order_url(order, format: :json)
end
