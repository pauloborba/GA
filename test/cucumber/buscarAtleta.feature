Feature Buscar Atleta
 As a usuário do sistema
 I want Buscar um atleta
 So that eu posso ver os dados de um atleta

 Scenario Buscar atleta não cadastrado gui
  Given estou no menu de atletas
  And  não existe atleta com cpf "12345678900"
  When é feita uma busca pelo cpf "12345678900"
  Then nenhum atleta aparece na tela

 Scenario Buscar atleta não cadastrado
  Given  o cpf "12345678900" não está cadastrado no sistema
  When é feita uma busca pelo atleta de cpf "12345678900"
  Then  nada é retornado

Scenario Buscar atleta cadastrado gui
 Given estou no menu de atletas
 And existe atleta com cpf "12345678900"
 When é feita uma busca pelo cpf "12345678900"
 Then Aparece na tela o atleta de cpf "12345678900"

Scenario Buscar atleta cadastrado
 Given  o cpf "12345678900" está cadastrado no sistema
 When é feita uma busca pelo atleta de cpf "12345678900"
 Then É retornado informações existentes do atleta de cpf "12345678900"
