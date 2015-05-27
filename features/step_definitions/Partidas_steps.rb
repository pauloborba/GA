Given(/^que existe uma partida com data "([^"]*)", com nome "([^"]*)", com tag "
([^"]*)"$/) do |arg1, arg2, arg3|
  partida = Partida.new("data", "nome", "Tag")
  find = partida.find(arg1,arg2,arg3)
  find == true
end

When(/^eu crio uma partida com data "([^"]*)",  com nome "([^"]*)", com tag "([^
"]*)"$/) do |arg1, arg2, arg3|
  partida = Partida.new("data", "nome", "Tag")
  partida.adicionarPartida(arg1, arg2, arg3)
end

Then(/^apartida com data "([^"]*)",  com nome "([^"]*)", com tag "([^
"]*)" nao e salva duas vezes\.$/) do |arg1, arg2, arg3|
  partida = Partida.new("data", "nome", "tag")
  partida.adicionarPartida(arg1, arg2, arg3)
end

Given(/^estou na pagina principal do time$/) do
  visit LoginPage
  fill_in "Login", :with => @supervisor.login
  fill_in "Password", :with => @supervisor.password
  visit GerenciamentoPartidasPage
  click_button "Partidas"
  visit PartidasPage
end

When(/^eu clico na opcao "Adicionar Partida"$/) do
  visit PartidasPage
  click_button "Adicionar Partida"
end

Then(/^a pagina de "Nova Partida" e exibida$/) do
  visit PartidasPage
  click_button "Adicionar Partida"
  visit NovaPartidaPage
end

Then(/^eu posso preencher o formulario de cadastro\.$/) do
  visit NovaPartidaPage
  fill_in 'Data', :with => 'Data'
  fill_in 'Nome', :with => 'Nome'
  fill_in 'Tag', :with => 'Tag'
end