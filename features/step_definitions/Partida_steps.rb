# -*- encoding : utf-8 -*-
# begin @JoaoSantos

def find_or_include_partida(nome, data, tag, list = nil)
  result = nil
  current_list = Partida.where(nome: nome, tag: tag)
  unless list.nil?
    current_list = list.where(nome: nome, tag: tag)
  end
  current_list.find_each do |partida|
    data_corrente = partida.data

    if same_data(data_corrente, data)
      result = partida
      break
    end
  end
  result
end

def same_data(data_corrente, data)
  (data_corrente.day.to_i == data[0..2].to_i) and (data_corrente.month.to_i == data[3..5].to_i) and (data_corrente.year.to_i == data[6..10].to_i)
end

def criandoPartida(data, nome, tag)
  new_partida = Partida.new({data: data, nome: nome, tag: tag})
  new_partida.save
  return new_partida
end

Given(/^que nao existe uma partida com data “([^"]*)”, com nome “([^"]*)”, com tag “([^"]*)”\.$/) do |data, nome, tag|
    @result = find_or_include_partida(nome, data, tag)

    expect(@result).to eq(nil)
    #if @result  == nil
    #  puts "Partida não existente."
    #else
    #  puts @result.nome
    #  puts @result.data
    #  puts @result.tag
    #end
end

When(/^eu crio uma partida com data “([^"]*)”,  com nome “([^"]*)”, com tag “([^"]*)”\.$/) do |data, nome, tag|
    if @result.nil?
      @new_partida = criandoPartida(data, nome, tag)

    end

    @new_partida.should_not eq(nil)
    #if @new_partida  == nil
    #  puts "Partida não adicionada."
    #else
    #  puts @new_partida.nome
    #  puts @new_partida.data
    #  puts @new_partida.tag
    #end
end

Then(/^a partida com data “([^"]*)”, com nome “([^"]*)”, com tag “([^"]*)” eh salva no sistema\.$/) do |data, nome, tag|
    @current_partida = find_or_include_partida(nome, data, tag)

    @current_partida.should_not eq(nil)

    #if @current_partida  == nil
    #  puts "Partida não salva."
    #else
    #  puts "Partida salva no sistema"
    #end
end


Given(/^que eu tenha no sistema a partida com data "([^"]*)”, com nome “([^"]*)”, com tag “([^"]*)”\.$/) do |data, nome, tag|
    @new_partida = criandoPartida("01/07/2013", "Náutico Vs Santa Cruz", "Série C")

    @new_partida = criandoPartida(data, nome, tag)

    @new_partida = criandoPartida("20/01/2010", "Náutico Vs Bahia", "Série C")

    @current_partida = find_or_include_partida(nome, data, tag)

    @current_partida.should_not eq(nil)

    #if @current_partida  == nil
    #  puts "Partida não existente."
    #else
    #  puts @current_partida.nome
    #  puts @current_partida.data
    #  puts @current_partida.tag
    #end
end

When(/^eu vejo a lista de partidas existentes\.$/) do
    @current_list_partidas = Partida.all

    expect(@current_list_partidas.any?).to eq(true)
    #if @current_list_partidas.any?
    #  puts "existe uma lista"
    #else
    #  puts "não existe uma lista"
    #end
end

Then(/^minha lista de paridas contem a partida com data "([^"]*)”, com nome “([^"]*)”, com tag “([^"]*)”\.$/) do |data, nome, tag|
    @current_partida = find_or_include_partida(nome, data, tag, @current_list_partidas)

    #if @existe
    #  puts "Lista contem Partida específica"
    #else
    #  puts "Lista não contem Partida específica"
    #end
    @current_partida.should_not eq(nil)
end


Given(/^que existe uma partida cadastrada no sistema com tag de valor "(.*?)"\.$/) do |tag|
  @new_partida = criandoPartida("01/07/2013", "Náutico Vs Santa Cruz", tag)
  #puts @new_partida.nome
  #puts @new_partida.tag
  #puts @current_partida.data
end

Given(/^estou na pagina de detalhes da partida$/) do
  visit partidas_path
end

When(/^eu clico em Edit a primeira partida$/) do
  find_link("Edit").click
end

Then(/^eu sou direcionado a pagina de editar partida$/) do
  visit edit_partida_path(@new_partida)
end

When(/^Eu preencho a tag  com o valor "(.*?)"$/) do |tag|
  fill_in "tag", with:tag
  @current_tag = tag
end

When(/^clico em salvar$/) do
  find_button("Salvar").click
end

Then(/^sou direcionado a página de detalhes da partida$/) do
  visit partidas_path
end

Then(/^eu posso visualizar nos detalhes da partida, o novo valor da tag$/) do
  @current_partida = find_or_include_partida("Náutico Vs Santa Cruz", "01/07/2013", @current_tag)
  #puts @current_partida.nome
  #puts @current_partida.tag
  #puts @current_partida.data
  @current_partida.should_not eq(nil)
end


# end @JoaoSantos

Given(/^que existe uma partida com data "([^"]*)", com nome "([^"]*)", com tag "([^"]*)"$/) do |arg1, arg2, arg3|
  find = Partida.find_by_data_and_nome_and_tag(arg1,arg2,arg3)
  find == true
end

When(/^eu crio uma partida com data "([^"]*)",  com nome "([^"]*)", com tag "([^"]*)"$/) do |arg1, arg2, arg3|
  result = criandoPartida(arg1, arg2, arg3)
  result == true
end

Then(/^a partida com data "([^"]*)",  com nome "([^"]*)", com tag "([^"]*)" nao e salva duas vezes$/) do |arg1, arg2, arg3|
  partida = Partida.new({data: arg1, nome: arg2, tag: arg3})
  #result = partida.adicionarPartida(arg1, arg2, arg3)
end

Given(/^estou na pagina principal do time$/) do
  visit partidas_path
  #visit LoginPage
  #fill_in "Login", :with => @supervisor.login
  #fill_in "Password", :with => @supervisor.password
  #visit GerenciamentoPartidasPage
  #click_button "Partidas"
  #visit PartidasPage
end

When(/^eu clico na opcao "Adicionar Partida"$/) do
  find_link("New Partida").click
  #visit PartidasPage
  #click_button "Adicionar Partida"
end

Then(/^a pagina de "Nova Partida" e exibida$/) do
  visit new_partida_path
  #click_button "Adicionar Partida"
  #visit NovaPartidaPage
end

Then(/^eu posso preencher o formulario de cadastro$/) do
  fill_in 'nome', :with => 'Nome Teste'
  fill_in 'tag', :with => 'Série C'
  fill_in 'data', :with => '12/03/2013'
end
