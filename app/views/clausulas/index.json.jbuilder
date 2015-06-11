json.array!(@clausulas) do |clausula|
  json.extract! clausula, :id, :titulo, :descricao
  json.url clausula_url(clausula, format: :json)
end
