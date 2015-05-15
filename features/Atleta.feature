Feature: Atleta
	As a supervisor cadastrado no sistema.
	I want adicionar, remover, atualizar e classificar atletas.
	So that eu possa gerar páginas da web e relatórios contendo as informações dos atletas

	Scenario: Adicionar atleta novo
		Given o sistema não tem o atleta com o CPF “09719992836”
		When eu adiciono o atleta com o CPF “09719992836”
		Then o atleta com o CPF “09719992836” está devidamente armazenado pelo sistema