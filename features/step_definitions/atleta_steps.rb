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
