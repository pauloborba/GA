# Adicionar uma nova clausula a um contrato #
Given(/^Eu tenha um atleta com cpf "([^"]*)"$/) do |cpf|
  @atleta = FactoryGirl.create(:atleta, cpf: cpf)
  @atleta.save

  @atleta.should_not eq(nil)
end

And(/^O atleta com cpf "([^"]*)" tem um contrato associado$/) do |cpf|
  @contrato = FactoryGirl.create(:contrato)
  @contrato.atleta = Atleta.find_by_cpf(cpf)

  @contrato.atleta.should_not eq(nil)
end

When(/^Eu crio uma nova clausula$/) do
  @clausula = FactoryGirl.create(:clausula)

  @clausula.should_not eq(nil)
end

And(/^Associo a clausula ao contrato do atleta$/) do
  tmp = Parte.new
  tmp.clausula = @clausula
  tmp.contrato = @contrato

  tmp.save
end

Then(/^Eu posso checar a nova clausula associada ao contrato$/) do
  @clausulas = @contrato.clausulas
  expect(@clausulas.include?(@clausula)).to eq(true)
end


# Checar clausulas de contratos #
Given /^Eu tenho um contrato cadastrado no sistema$/ do
  @contrato = FactoryGirl.create(:contrato)
  @contrato.save
end

And(/^Eu tenha uma clausula associado ao contrato$/) do
  @clausula = FactoryGirl.create(:clausula)
  @clausula.save

  tmp = Parte.new
  tmp.clausula = @clausula
  tmp.contrato = @contrato

  tmp.save
end

And /^Eu esteja na pagina de contratos$/  do
  visit :contratos
end

When /^Eu clico no link "([^"]*)" do primeiro contrato$/ do |link|
  find_link(link).click
end

Then /^Eu devo ver os detalhes do contrato$/ do
  expect(current_path).to eq(contrato_path(@contrato))
end

When /^Eu clico no link "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^Eu devo ver as clausulas do contrato$/ do
  page.should have_css("td", :text => @clausula.titulo)
  page.should have_css("td", :text => @clausula.descricao)
end


# Clausulas deverão ter titulos unicos #
Given(/^Eu esteja na pagina de clausulas$/) do
  visit :clausulas
end

And(/^Eu tenha uma clausula com titulo "([^"]*)"$/) do |title|
  @clausula = FactoryGirl.create(:clausula, titulo: title)
  @clausula.save
end

Then(/^Eu devo estar na pagina de criação de uma nova clausula$/) do
  expect(current_path).to eq(new_clausula_path)
end

When(/^Eu preencho titulo com "([^"]*)"$/) do |titulo|
  fill_in "Titulo", with: titulo
end

And(/^Eu preencho descrição com "([^"]*)"$/) do |descricao|
  fill_in "Descrição", with:descricao
end

And(/^Eu clico no botão "([^"]*)"$/) do |botao|
  click_button(botao)
end

Then(/^Eu devo ver uma mensagem de erro "([^"]*)"$/) do |msg|
  page.should have_content  msg
end

# Associar uma clausula a um contrato #
And(/^Eu tenha uma clausula cadastrada no sistema$/) do
  @clausula = FactoryGirl.create(:clausula)
  @clausula.save
end

And(/^Eu esteja na pagina de clausulas do contrato$/) do
  visit list_clausulas_path(@contrato)
end

Then(/^Eu devo estar na pagina de adicionar clausulas do contrato$/) do
  expect(current_path).to eq(add_clausulas_path(@contrato))
end

And(/^Eu devo ver a nova clausula na lista de clausulas$/) do
  page.should have_css("<td>", @clausula.title)
end