json.array!(@pets) do |pet|
  json.extract! pet, :id, :species, :name, :description, :image_url, :age
  json.url pet_url(pet, format: :json)
end
