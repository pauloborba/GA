# encoding: UTF-8

Given(/^que eu quero apagar o cpf existente "([^"]*)" do sistema$/) do |arg1|
  pending
  #check('arg1')
  #cpf = find_cpf_system(arg1)
  #assert_nil cpf
end

When(/^eu clicar em remover o cpf "([^"]*)"$/) do |arg1|
  pending
  #find("bottom", match: :first).click
end

When(/^clico em "([^"]*)"$/) do |arg1|
  pending
  #find("bottom", match: :second).click
end

Then(/^a pagina de remoçao e atualizada sem nenhuma alteracao$/) do
  pending
  #visit('RemovePage')
end

Given(/^que o atleta de cpf "([^"]*)" nao possui classificacao$/) do |arg1|
  pending
  #check('arg1')
  #classification = find_classification_system (arg1)
  #assert classification
end

When(/^eu classifico o atleta de cpf "(\d+)" como "([^"]*)"$/) do |arg1, arg2|
  pending
  #find("li", match: "Júnior").click
end

Then(/^o sistema salva a classificacao do atleta de cpf "([^"]*)" como "([^"]*)"
$/) do |arg1, arg2|
  pending
  #set_classfication(arg1,arg2)
end