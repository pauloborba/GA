Given(/^o sistema nao tem o atleta com o cpf "([^"]*)"$/) do |arg1|
atleta = Atletas.new("gabriel henrique", "ghdr@cin.ufpe.br", "99878798", "01/01/91", "09898787656", "8765667", "1,75cm", "70kg", "atacante", "sub 17", "sim")
resul = atleta.find_cpf(arg1)
resul == false
end

When(/^eu adiciono o atleta com o cpf "([^"]*)"$/) do |arg1|
atleta = Atletas.new("gabriel henrique", "ghdr@cin.ufpe.br", "99878798", "01/01/91", "09898787656", "8765667", "1,75cm", "70kg", "atacante", "sub 17", "sim")
atleta.adicionarAtleta(arg1)
end

Then(/^o atleta com o cpf "([^"]*)" esta devidamente armazenado pelo sistema$/) do |arg1|
atleta = Atletas.new("gabriel henrique", "ghdr@cin.ufpe.br", "99878798", "01/01/91", "09898787656", "8765667", "1,75cm", "70kg", "atacante", "sub 17", "sim")
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
fill_in 'Nome', :with => 'gabriel henrique'
fill_in "Email", :with => 'ghdr@cin.ufpe.br'
fill_in 'Telefone', :with => '99878798'
fill_in 'Data_Nascimento', :with => '01/01/91'
fill_in 'CPF', :with => '09898787656'
fill_in 'RG', :with => '8765667'
fill_in 'Altura', :with => '1,75cm'
fill_in 'Peso', :with => '70kg'
fill_in 'Posicao_Joga', :with => 'atacante'
fill_in 'Categoria', :with => 'sub 17'
fill_in 'Alojamento_Clube', :with => 'sim'
end