json.array!(@tanks) do |tank|
  json.extract! tank, :id, :number, :volume, :filled, :gasoline_id
  json.url tank_url(tank, format: :json)
end
