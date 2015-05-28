Feature: Atleta
	As a supervisor cadastrado no sistema
	I want adicionar, remover, atualizar e classificar atletas
	So that eu possa gerar paginas da web e relatorios contendo as informacoes dos atletas

	Scenario: Adicionar atleta novo
		Given o sistema nao tem o atleta com o cpf "09719992836"  
		When eu adiciono o atleta com o cpf "09719992836"
		Then o atleta com o cpf "09719992836" esta devidamente armazenado pelo sistema

	Scenario: Adicionar Atleta novo web 
		Given estou no menu de Atletas
		When eu selecionar a opcao "Adicionar" no menu de Atletas
		Then eu posso preencher os dados do atleta

	Scenario: Adicionar atleta invalido web (nome campo em branco) 
		Given estou na pagina de adicionar novo atleta
		When eu preencher todas as informacoes do atleta, exceto o campo nome
		And eu opto por criar o artigo
		Then uma mensagem de erro e mostrada

	Scenario: Adicionar atleta inválido (nome campo em branco) 
		Given o sistema nao tem nenhum atleta com o CPF "09812304954"
		When eu adicionar o atleta com o CPF "09812304954" com o campo "nome" em branco
		Then o atleta com o CPF "09812304954" nao e cadastrado pelo sistema porque e invalido

	Scenario: Adicionar atleta duplicado 
		Given o sistema tenha o atleta com o CPF "08976898765"
		When eu adicionar o atleta com o CPF "08976898765"
		Then o atleta com o CPF "08976898765" nao e armazenado duas vezes

	Scenario: Classificar atleta inválido web
		Given estou na página de classificar atleta
		When eu preencher os dados do atleta que é para ser Júnior
		And preencho o campo com Profissional
		And eu opto por classificar o atleta
		Then uma mensagem de erro é mostrada

	Scenario: Classificar atleta web
		Given estou no menu de Atletas
		When eu selecionar a opção “Classificar” no menu de Atletas
		Then eu posso preencher os dados para classificar o atleta

	Scenario: Atualizar dados de um Atleta que não está no sistema 
		Given eu estou na página de atualização de atleta
		And eu quero atualizar os dados o atleta com o cpf “09934567391” que não está cadastrado no sistema
		When eu busco os dados atualizados do atleta
		Then  aparecerá uma mensagem  “O atleta não existe no sistema”

	Scenario: Atualizar dados web de atleta existente 
		Given eu estou na pagina de atualizacao de atleta
		And o atleta com o cpf "12190871234" esta cadastrado no sistema
		And eu mudo os dados do atleta com o cpf "12190871234"
		And eu seleciono a opcao "Atualizar"
		Then ira aparecer uma mensagem de confirmacao na tela

	Scenario: Atualizar dados de atleta existente 
		Given o sistema tenha o atleta com o cpf "12190871234" 
		When eu modifico os dados do atleta com o cpf "12190871234"
		Then os dados do atleta com o cpf "12190871234"estao devidamente atualizado no sistema

	Scenario: Atualizar dados de Atleta não existente 
		Given Eu tento atualizar dados do atleta  com cpf  “09934567391” que  não está cadastrado no sistema
		When eu busco os dados do atleta com o cpf “09934567391” 
		Then os dados não serão atualizados porque o atleta é inválido

	Scenario: Classificar um atleta não existente
		Given o atleta com o cpf “09912345442” não está cadastrado  no sistema 
		When eu classificar o atleta como “Júnior”
		Then a classificação não será salva no sistema porque o atleta é inválido

	Scenario: Classificar atleta de forma errada 
		Given o atleta com o cpf “09912345442” é Júnior
		And eu o classifico com Profissional
		When eu classificar o atleta
		Then a classificação não será salva no sistema porque está classificado de forma errada
