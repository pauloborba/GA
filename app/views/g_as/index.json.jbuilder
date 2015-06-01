json.array!(@gas) do |ga|
  json.extract! ga, :id, :nome
  json.url ga_url(ga, format: :json)
end
