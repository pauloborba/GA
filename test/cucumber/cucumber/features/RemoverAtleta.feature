Feature: Atleta
    As a supervisor cadastrado no sistema.
    I want adicionar, remover, atualizar e classificar atletas.
    So that eu possa gerar paginas da web e relatorios contendo as informacoes dos atletas.

Scenario: Remover atleta existente

    Given que o sistema tenha o atleta de cpf "10925614756"
    When eu excluir o atleta de cpf "10925614756"
    Then o atleta de cpf "10925614756" está devidamente removido pelo sistema

Scenario: Remover atleta web existente
    
    Given que eu estou na pagina de remoçao de atletas
    And o atleta de cpf "10595687914" esta armazenado no sistema
    When eu seleciono a opçao remover no show da pagina
    Then uma mensagem de remocao com sucesso sera exibida no topo da pagina

Scenario: Remover atleta não existente

    Given que o sistema nao tenha o atleta de cpf "149568998854"
    When eu tentar excluir o atleta de cpf "149568998854"
    Then o sistema nao sera alterado
    
Scenario: Remover atleta web não existente

    Given que eu estou na pagina de remocao de atletas
    And o atleta de cpf "75436589977" nao está armazenado no sistema
    When eu seleciono a opçao remover no show da pagina
    Then uma mensagem de erro sera mostrada informando que aquele cpf nao esta registrado no sistema
