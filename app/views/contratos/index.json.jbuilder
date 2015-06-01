json.array!(@contratos) do |contrato|
  json.extract! contrato, :id, :contratado, :data, :salario
  json.url contrato_url(contrato, format: :json)
end
