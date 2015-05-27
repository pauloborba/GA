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