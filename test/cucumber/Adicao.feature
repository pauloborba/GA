Feature: Cadastro de jogadores
  As a user of the system,
  I Will be alowed to register athletes,
  So see theyr informations like CPF, Full name, Position and other personal information.




#Controller
Scenario: Adicionar Jogador Já cadastrado
  Given O Jogador com CPF “12345678910” e com nome "j1" Já está cadastrado
  When Tentar inserir um jogador com CPF “12345678910” e com nome "j2" na lista de jogadores
  Then O Jogador “12345678910” , "j2" não será inserido
  And O jogador "j1" existente continua na lista




Scenario: Adicionar Jogador com gols negativos
  Given O sistema está esperando uma ação do usuário
  When Tenta inserir um jogador com nome "j3" , CPF "12345678911" , golsfeitos “-16”
  Then Jogador com CPF “12345678911" não é inserido




#GUI
Scenario: Adicionar Jogador
  Given Estou na tela de listagem de jogadores
  When Vou para o menu de cadastrar jogadores
  And preencho os campos CPF e Nome
  And Então confirmo a criação
  Then Vou para o menu de confirmação de criação de jogador




Scenario: Remover Jogador
  Given Estou na tela Show jogador de um jogador com nome "j1" e CPF "12345678910"
  When Tento remover o jogador "j1"
  And Confirmo que desejo remover
  Then Não visualizo o nome do jogador "j1" na pagina de listagem de jogador
