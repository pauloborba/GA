Feature Buscar Atleta
 As a usuário do sistema
 I want Buscar um atleta
 So that eu posso ver os dados de um atleta

Scenario Buscar atleta não cadastrado
 Given estou no menu de atletas
 And não existe atleta com nome "João Andrade"
 When é feita uma busca pelo nome "João Andrade"
 Then uma mensagem de erro aparece na tela

Scenario Buscar atleta não cadastrado
 Given o atleta de nome "João Andrade" não está cadastrado no sistema
 When é feita uma busca pelo nome "João Andrade"
 Then nenhum resultado é retornado

Scenario Buscar atleta cadastrado
 Given estou no menu de atletas
 And existe um atleta com nome "Pedro Silva"
 When é feita uma busca pelo nome "Pedro Silva"
 Then é exibido na tela informações de "Pedro Silva"

Scenario Buscar atleta cadastrado
 Given "Pedro Silva" está cadastrado no sistema
 When busco pelo atleta de nome "Pedro Silva"
 Then É retornado datalhes do atleta "Pedro Silva"
