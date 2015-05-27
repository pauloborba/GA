Given(/^o sistema nao tem o atleta com o cpf "([^"]*)"$/) do |arg1|
atleta = Atletas.new("nome", "email", "telefone", "data_nascimento", "cpf", "rg", "altura", "peso", "posicao_joga", "categoria", "alojamento_clube")
resul = atleta.find_cpf(arg1)
resul == false
end

When(/^eu adiciono o atleta com o cpf "([^"]*)"$/) do |arg1|
atleta = Atletas.new("nome", "email", "telefone", "data_nascimento", "cpf", "rg", "altura", "peso", "posicao_joga", "categoria", "alojamento_clube")
atleta.adicionarAtleta(arg1)
end

Then(/^o atleta com o cpf "([^"]*)" esta devidamente armazenado pelo sistema$/) do |arg1|
atleta = Atletas.new("nome", "email", "telefone", "data_nascimento", "cpf", "rg", "altura", "peso", "posicao_joga", "categoria", "alojamento_clube")
resul1 = atleta.find_cpf(arg1)
resul1 == true
end

Given(/^estou no menu de Atletas$/) do
visit LoginPage
fill_in "Login", :with => @supervisor.login
fill_in "Password", :with => @supervisor.password
visit GerenciamentoAtletasPage
click_button "Atletas"
visit AtletasPage
end 

When(/^eu selecionar a opcao "Adicionar" no menu de Atletas$/) do
visit AtletasPage
click_button "Adicionar"
end

Then(/^eu posso preencher os dados do atleta$/) do
visit AdicionarAtletaPage
fill_in 'Nome', :with => 'Nome'
fill_in "Email", :with => 'Email'
fill_in 'Telefone', :with => 'Telefone'
fill_in 'Data_Nascimento', :with => 'Data de Nascimento'
fill_in 'CPF', :with => 'CPF'
fill_in 'RG', :with => 'RG'
fill_in 'Altura', :with => 'Altura'
fill_in 'Peso', :with => 'Peso'
fill_in 'Posicao_Joga', :with => 'Posicao_Joga'
fill_in 'Categoria', :with => 'Categoria'
fill_in 'Alojamento_Clube', :with => 'Alojamento_Clube'
end

Given(/^eu estou na pagina de atualizacao de atleta$/) do
#visit GerenciamentoAtletasPage
#visit LoginPage
#fill_in "Login", :with => @supervisor.login
#fill_in "Password", :with => @supervisor.password
#click_button "Atletas"
#visit AtletasPage
#click_button "Atualizaçao"
#visit AtualizarPage
end

Given(/^o atleta com o cpf "([^"]*)" esta cadastrado no sistema$/) do |arg1|
  #atleta = Atletas.find_cpf(arg1)
  #retorno == true

end

When(/^eu mudo os dados do atleta com o cpf "([^"]*)"$/) do |arg1|
  #atualizar(arg1)

end

When(/^eu seleciono a opcao "([^"]*)"$/) do |arg1|
  #click_button "Atualizar"
end


Then(/^ira aparecer uma mensagem de confirmacao na tela$/) do 
  #messagemAtualizar()
end

Given(/^o sistema tenha o atleta com o cpf "([^"]*)"$/) do |cpf|
  atleta = Atletas.new
  retorno = atleta.find_cpf(cpf)
  retorno == true
end

When(/^eu modifico os dados do atleta com o cpf "([^"]*)"$/) do |cpf|
  atleta =Atletas.new 
  retorna = atleta.atualizar(cpf)
  retorna == true
end

Then(/^os dados do atleta com o cpf "([^"]*)"estao devidamente atualizado no sistema$/) do |cpf| 
  atleta = Atletas.new
  retorno = atualizado(cpf)
  retorno = true
 end
