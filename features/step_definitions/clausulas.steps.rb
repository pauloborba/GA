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
  tmp = Parte.create
  tmp.clausula = @clausula
  tmp.contrato = @contrato

  tmp.save
end

Then(/^Eu posso checar a nova clausula associada ao contrato$/) do
  @clausulas = @contrato.clausulas
  expect(@clausulas.include?(@clausula)).to eq(true)
end