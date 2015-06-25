# -*- encoding : utf-8 -*-
# begin @JoaoSantos

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
    @new_partida = nil
    if @result == nil
      @new_partida = Partida.new({data: data, nome: nome, tag: tag})
      @new_partida.save()
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


def find_or_include_partida(nome, data, tag, list = nil)
  result = nil
  current_list = Partida.where(nome: nome, tag: tag)
  if list != nil
    current_list = list.where(nome: nome, tag: tag)
  end
  current_list.find_each do |partida|
    data_corrente = partida.data

    if (data_corrente.day.to_i == data[0..2].to_i) and (data_corrente.month.to_i == data[3..5].to_i) and (data_corrente.year.to_i == data[6..10].to_i)
      result = partida
      break
    end
  end
  return result
end


Given(/^que eu tenha no sistema a partida com data "([^"]*)”, com nome “([^"]*)”, com tag “([^"]*)”\.$/) do |data, nome, tag|
    @new_partida = Partida.new({data: "01/07/2013", nome: "Náutico Vs Santa Cruz", tag: "Série C"})
    @new_partida.save()

    @new_partida = Partida.new({data: data, nome: nome, tag: tag})
    @new_partida.save()

    @new_partida = Partida.new({data: "20/01/2010", nome: "Náutico Vs Bahia", tag: "Série C"})
    @new_partida.save()

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
  @new_partida = Partida.new({data: "01/07/2013", nome: "Náutico Vs Santa Cruz", tag:tag })
  @new_partida.save()
  #puts @new_partida.nome
  #puts @new_partida.tag
  #puts @current_partida.data
end

Given(/^estou na pagina de detalhes da partida$/) do
  visit partidas_path
end

When(/^eu clico em "(.*?)" a primeira partida$/) do |link|
  find_link(link).click
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
  @new_partida.tag = @current_tag
  @new_partida.save()
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
