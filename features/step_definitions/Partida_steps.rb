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
    #expect(@new_partida.output).to include(text)
    @current_partida == true
end
