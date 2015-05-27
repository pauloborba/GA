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
