json.array!(@partidas) do |partida|
  json.extract! partida, :id, :nome, :tag, :data
  json.url partida_url(partida, format: :json)
end
