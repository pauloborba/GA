json.array!(@atletas) do |atleta|
  json.extract! atleta, :id, :nome, :email, :telefone, :data_nascimento, :cpf, :rg, :altura, :peso, :posicao_joga, :categoria, :alojamento_clube
  json.url atleta_url(atleta, format: :json)
end
