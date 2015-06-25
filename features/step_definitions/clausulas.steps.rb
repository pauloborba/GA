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
Given /^Eu tenho algum contrato cadastrado no sistema$/ do
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

