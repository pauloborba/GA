Feature: Cota de jogos e sal�rio
As a: Usu�rio do sistema
I want: Modificar cota de jogos e sal�rio
So that: Eu possa gerenciar os custos de cada jogador

Scenario: Jogos como Titular
Given: Que o contrato do jogador �Kuki� est� ativo
And: E �Kuki� tem �8� jogos como titular
When: �Kuki� � escalado como titular
Then: Defina o n�mero de jogos como titular de �Kuki� como �9�

Scenario: Modificar acr�scimo de sal�rio
Given: Estou no menu de edi��o de sal�rio
And: O acr�scimo de sal�rio para �Kuki� seja de �R$ 5.000,00�
When: Eu tento modificar para �R$ 4.000,00�
Then: O acr�scimo de sal�rio � atualizado com sucesso

Scenario: Modificar acr�scimo de sal�rio
Given: Estou no menu de edi��o de sal�rio
And: O acr�scimo de sal�rio para �Kuki� seja de �R$ 6.000,00�
When: Eu tento modificar para �R$ -3.000,00�
Then: Recebo uma mensagem de erro

Scenario: Modificar cota de jogos
Given: Estou no menu de edi��o de cota de jogos
And: A cota de jogos como titular de �Kuki� seja �10�
When: Eu tento modificar para �8�
Then: A cota de jogos � atualizada com sucesso

Scenario: Modificar cota de jogos
Given: Estou no menu de edi��o de cota de jogos
And: A cota de jogos como titular de �Kuki� seja �10�
When: Eu tento modificar para �-15�
Then: Recebo uma mensagem de erro
