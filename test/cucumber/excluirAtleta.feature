Feature: Excluir Atleta
 As a usuário do sistema
 I want remover um atleta
 So that eu posso remover os dados do atletas de um clube


Scenario: Excluir o atleta “Pedro” com Sucesso
Given estou no menu de atletas
And o atleta de CPF “01234567890” aparece na lista de atletas cadastrados
When tento excluir o atleta “Pedro” com CPF “01234567890”
Then posso ver uma mensagem de confirmação de exclusão e o nome “Pedro” e CPF “01234567890”

Scenario: Excluir o atleta “Pedro” com fracasso
Given estou no menu de atletas
And o atleta de CPF “01234567890” não aparece na lista de atletas cadastrados
When tento excluir o atleta “Pedro” com CPF “01234567890”
Then posso ver uma mensagem de erro de exclusão e o nome “Pedro” e CPF “01234567890”

Scenario: Excluir Atleta Novo no Sistema com sucesso
Given o atleta de CPF “01234567890” está cadastrado no sistema
When tento excluir o atleta de CPF “01234567890”
Then O sistema remove o atleta com sucesso 

Scenario: Excluir Atleta Novo no Sistema com fracasso
Given o atleta de CPF “01234567890” não está cadastrado no sistema
When tento excluir o atleta de CPF “01234567890”
Then a base de dados não sofre alteracao
