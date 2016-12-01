Feature: Atualizar jogador
  As a usuário do software de GA
  I want atualizar as informações de atletas já cadastrados
  So that eu não preciso excluir e re-cadastrar o atleta para alterar alguma informação

#GUI
   Scenario: Atualizar jogador
   	Given o atleta "Carlinhos Bala" de CPF "123.132.124.45", data de nascimento "10/10/1980" e posição "atacante" está cadastrado no sistema
   	And eu estou na página de edição do atleta "Carlinhos Bala"
   	When eu mudo o nome do atleta para "Carlito Balas"
   	And eu clico no botão "atualizar"
   	Then eu permaneço na página de edição do atleta
   	And eu vejo uma mensagem de confirmação de atualização do atleta
