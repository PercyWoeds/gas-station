json.array!(@gasolines) do |gasoline|
  json.extract! gasoline, :id, :name, :class, :price
  json.url gasoline_url(gasoline, format: :json)
end
