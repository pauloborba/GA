Feature: Cota de jogos e salário
As a: Usuário do sistema
I want: Modificar cota de jogos e salário
So that: Eu possa gerenciar os custos de cada jogador

Scenario: Jogos como Titular
Given: O contrato do jogador “Kuki” está ativo
And: E “Kuki” tem “8” jogos como titular
When: “Kuki” é escalado como titular
Then: O Sistema altera o número de jogos como titular de “Kuki” para “9”

Scenario: Modificar acréscimo de salário
Given: Estou no menu de "edição de salário"
And: O acréscimo de salário para “Kuki” seja de “R$ 5.000,00”
When: Eu tento modificar o acréscimo de salário de "Kuki" para “R$ 4.000,00”
Then: O acréscimo de salário é atualizado com sucesso

Scenario: Modificar acréscimo de salário sem sucesso
Given: Estou no menu de "edição de salário"
And: O acréscimo de salário para “Kuki” seja de “R$ 6.000,00”
When: Eu tento modificar o acréscimo de salário de "Kuki" para “R$ -3.000,00”
Then: Recebo uma mensagem de erro

Scenario: Modificar cota de jogos
Given: Estou no menu de "edição de cota de jogos"
And: A cota de jogos como titular de “Kuki” seja “10”
When: Eu tento modificar a cota de jogos como titular de “Kuki” para “8”
Then: A cota de jogos é atualizada com sucesso

Scenario: Modificar cota de jogos sem sucesso
Given: Estou no menu de "edição de cota de jogos"
And: A cota de jogos como titular de “Kuki” seja “10”
When: Eu tento modificar a cota de jogos como titular de “Kuki” para “-15”
Then: Recebo uma mensagem de erro
