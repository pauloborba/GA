Given(/^estou cadastrando uma partida&/) do 
  partida = Partida.new("nome", "tag", "data", nil, "descricao")
  partida.adicionarPartida(partida)
end

When(/^eu tento confirmar o cadastro de uma partida com campos faltando$/) do
  vazio = partida.temCampoFaltando?
end

Then(/^uma mensagem de erro e retornada$/) do
  error_message = "Partida nao sera cadastrada"
  STDOUT.should include(error_message)
end
############

Given(/^estou cadastrando uma partida&/) do 
  partida = Partida.new("nome", "tag", "data", nil, "descricao")
  partida.adicionarPartida(partida)
end

When(/^eu tento confirmar o cadastro de uma partida inválida$/) do
  valida = partida.valida?
end

Then(/^a partida não é  cadastrada$/) do
  error_message = "Partida nao sera cadastrada"
  STDOUT.should include(error_message)
end
