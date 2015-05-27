Feature: Atleta
    As a supervisor cadastrado no sistema.
    I want adicionar, remover, atualizar e classificar atletas.
    So that eu possa gerar páginas da web e relatórios contendo as informações dos atletas.

Scenario: Opções antes de remover um atleta existente no sistema

    Given que o sistema mostra o cpf "10905365429" como existente
    When eu clicar em remover o cpf “10905365429”
    Then o sistema exibe uma mensagem “Tem certeza que deseja remover o atleta?” com as opções "Sim" "Não"

Scenario: Remover atleta não existente

    Given que eu quero remover o atleta de cpf “10905365428” que não existe no sistema
    When eu buscar o cpf “10905365428” no sistema
    Then o sistema emite uma mensagem “CPF não existente.”

Scenario: Remover atleta existente

    Given que o cpf "85858896354" que eu quero remover é encontrado no sistema
    When eu clicar em remover o cpf "85858896354"
    And clicar em "Sim"
    Then o sistema apaga o cpf "85858896354" do banco de dados

Scenario: Cancelar a remoção de atleta existente

    Given que eu quero apagar o cpf existente "45445666654" do sistema
    When eu clicar em remover o cpf "45445666654"
    And clico em "Não"
    Then a página de remoção é atualizada sem nenhuma alteração

Scenario: Classificar um atleta sem classificação

    Given que o atleta de cpf "45666589988" não tem classificação
    When eu classifico o atleta de cpf “45666589988” como "Júnior"
    Then o sistema salva a classificação do atleta de cpf "45666589988" como "Júnior"

Scenario: Classificar um atleta como profissional

    Given que o atleta de cpf "45666589988" tem classificação "Júnior"
    When eu alterar a classificação do atleta de cpf "45666589988" para "Profissional"
    Then o sistema muda em seu banco de dados de "Júnior" para "Profissional"
