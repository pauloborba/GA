Feature: Atleta
    As a usuario cadastrado no sistema
    I want adicionar e editar atletas
    So that eu possa gerenciar as informacoes dos atletas

    Scenario: Editar Atleta 
     Given o sistema possui um atleta com CPF "11281727371"
     When eu edito as informacoes do atleta com CPF "11281727371"
     Then o atleta com cpf "11281727371" é salvo no sistema com as novas informacoes

    Scenario: Editar atleta e deixar campos obrigatorios em branco
     Given o sistema possui um atleta com CPF "11281727371"
     When eu edito as informacoes do atleta com CPF "11281727371"
     And deixo um campo obrigatorio em branco
     Then o atleta com cpf "11281727371" nao tem suas informacoes alteradas

    Scenario: Editar Atleta web
     Given estou na pagina de atletas
     When eu seleciono a opcao "Editar"
     And eu faco as alteracoes dos dados do atleta
     And seleciono a opcao "Salvar"
     Then eu posso ver uma mensagem de confirmacao

    Scenario: Editar atleta e deixar campo obrigatorio em branco
     Given estou na pagina de Atletas
     When eu seleciono a opcao "Editar"
     And eu altero os dados
     And deixo um campo obrigatorio em branco
     And seleciono a opcao "Salvar"
     Then eu posso ver uma mensagem de erro



    	

