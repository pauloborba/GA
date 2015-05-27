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