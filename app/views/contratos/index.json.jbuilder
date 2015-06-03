json.array!(@contratos) do |contrato|
  json.extract! contrato, :id, :data_Inicio, :data_Termino, :atleta_id, :contrata, :valor
  json.url contrato_url(contrato, format: :json)
end
