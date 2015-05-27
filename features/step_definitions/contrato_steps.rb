# encoding: UTF-8

# CONTROLLER
# scenario: criar contrato novo
Given (/^que nao existe um contrato entre contratante "Nautico" e contratada "([^"]*)"$/) do |atleta|
	contrato = Contrato.find(:contratada => atleta)
	assert_equal(contrato, nil)
end

When (/^eu crio um contrato entre contratante "Nautico" e contratada "([^"]*)"$/) do |atleta|
	new_contrato = Contrato.new
	new_contrato.contratante = "Nautico"
	new_contrato.contratada = atleta
end

Then (/^o contrato entre contratante "Nautico" e contratada "([^"]*)" é salvo no sistema$/) do |atleta|
	new_contrato = Contrato.new
	new_contrato.contratante = "Nautico"
	new_contrato.contratada = atleta
	new_contrato.save
end

# scenario: remover contrato

# scenario: editar valor do contrato

# ERRO
# scenario: criar contrato duplicado

# scenario: adicionar clausula duplicada

# GUI
# scenario: visualizar contrato web
Given (/^que eu estou na página de contratos$/) do
	pending
end

And (/^existe um contrato entre contratante “Náutico” e contratada “([^"]*)”$/) do |atleta|
	pending
end

When (/^eu clico no botão “visualizar contrato”$/) do
	pending
end

Then (/^todos os atributos do contrato e uma listagem de suas cláusulas são exibidas$/) do
	pending
end

# scenario: listar contratos ordenados por valor web