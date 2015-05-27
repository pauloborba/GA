# -*- encoding : utf-8 -*-
Given(/^que nao existe uma partida com data “(\d+)\/(\d+)\/(\d+)”, com nome “Nautico VS Sport”, com tag “Serie A”\.$/) do |data, nome, tag|
    @result = Partida.find_partida(data, nome, tag)
    @result == false
end

When(/^eu crio uma partida com data “(\d+)\/(\d+)\/(\d+)”,  com nome “Nautico VS Sport”, com tag “Serie A”\.$/) do |data, nome, tag|
    @new_partida = Partida.create_partida(data, nome, tag)
    @new_partida.criou
    @new_partida != nil
end

Then(/^a partida com data “(\d+)\/(\d+)\/(\d+)”, com nome “Nautico VS Sport”, com tag “Serie A” eh salva no sistema\.$/) do |data, nome, tag|
    @current_partida = Partida.find_partida(data, nome, tag)
    @current_partida == true
end


Given(/^que eu tenha no sistema a partida com data "(\d+)\/(\d+)\/(\d+)”, com nome “Nautico VS Sport”, com tag “Serie A”\.$/) do |data, nome, tag|
    @current_partida = Partida.find_partida(data, nome, tag)
    @current_partida == true
end

When(/^eu vejo a lista de partidas existentes\.$/) do
    @current_list_partidas = Partida.listPartidas()
end

Then(/^minha lista de paridas contem a partida com data "(\d+)\/(\d+)\/(\d+)”, com nome “Nautico VS Sport”, com tag “Serie A”\.$/) do |data, nome, tag|
    @existe = @current_list_partidas.include?(Partida.find_partida(data, nome, tag))
    @existe == true
end

Given(/^que existe uma partida com data "([^"]*)", com nome "([^"]*)", com tag "([^"]*)"$/) do |arg1, arg2, arg3|
  partida = Partida.new()
  find = partida.find(arg1,arg2,arg3)
  find == true
end

When(/^eu crio uma partida com data "([^"]*)",  com nome "([^"]*)", com tag "([^"]*)"$/) do |arg1, arg2, arg3|
  partida = Partida.new()
  result = partida.adicionarPartida(arg1, arg2, arg3)
  result == true
end

Then(/^a partida com data "([^"]*)",  com nome "([^"]*)", com tag "([^"]*)" nao e salva duas vezes$/) do |arg1, arg2, arg3|
  partida = Partida.new()
  result = partida.adicionarPartida(arg1, arg2, arg3)
  result == false
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

Then(/^eu posso preencher o formulario de cadastro$/) do
  visit NovaPartidaPage
  fill_in 'Data', :with => 'Data'
  fill_in 'Nome', :with => 'Nome'
  fill_in 'Tag', :with => 'Tag'
  fill_in 'Placar', :with => 'Placar'
  fill_in 'Descricao', :with => 'Descricao'
end
