Feature: Clausulas


Scenario: Adicionar uma nova clausula a um contrato
  Given Eu tenha um atleta com cpf "03828153491"
  And O atleta com cpf "03828153491" tem um contrato associado
  When Eu crio uma nova clausula
  And Associo a clausula ao contrato do atleta
  Then Eu posso checar a nova clausula associada ao contrato

Scenario: Checar clausulas de contratos
  Given Eu tenho um contrato cadastrado no sistema
  And Eu tenha uma clausula associado ao contrato
  And Eu esteja na pagina de contratos
  When Eu clico no link "Show" do primeiro contrato
  Then Eu devo ver os detalhes do contrato
  When Eu clico no link "Ver Clausulas"
  Then Eu devo ver as clausulas do contrato

Scenario: Clausulas deverão ter titulos unicos
  Given Eu esteja na pagina de clausulas
  And Eu tenha uma clausula com titulo "Remuneração extra por gols"
  When Eu clico no link "Nova Clausula"
  Then Eu devo estar na pagina de criação de uma nova clausula
  When Eu preencho titulo com "Remuneração extra por gols"
  And Eu preencho descrição com "10 Porcento do salario a cada 20 gols"
  And Eu clico no botão "Salvar"
  Then Eu devo ver uma mensagem de erro "Já existe clausula com mesmo título!"

Scenario: Associar uma clausula a um contrato
  Given Eu tenho um contrato cadastrado no sistema
  And Eu tenha uma clausula cadastrada no sistema
  And Eu esteja na pagina de detalhes do contrato
  When Eu clico no link "Adicionar Clausulas"
  Then Eu devo estar na pagina de adicionar clausulas do contrato
  When Eu clico no link "Adicionar"
  Then Eu devo ver as clausulas do contrato
  And Eu devo ver a nova clausula na lista de clausulas

Scenario: Editar clausula
  Given Eu tenho uma clausula cadastrada no sistema
  And Eu esteja na pagina de clausulas
  When Eu clico no link "Editar"
  Then Eu sou direcionado pagina de editar clausula
  When Eu preencho titulo com "Desconto por atrasos"
  And Eu preencho descrição com "1 Por cento a cada 10 horas de atraso acumuladas"
  And Eu clico no botão "Salvar"
  Then Eu sou direcionado para a pagina de exibicao de clausula
  And Eu posso visualizar nos dados da clausula o titulo "Desconto por atrasos"
  And Eu posso visualizar nos dados da clausula a descricao "1 Por cento a cada 10 horas de atraso acumuladas"


 Scenario:
