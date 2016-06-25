Feature: Contratos
  As a usuario do sistema
  I want adicionar e cancelar contratos
  So that eu posso gerenciar os contratos dos atletas

Scenario: Criar contrato
    Given O atleta de cpf "01234567890" não possui contratos cadastrados
    When Eu tento cadastrar um contrato para o atleta de cpf "0123456789"
    Then O sistema cadastra corretamente o contrato para o atleta de cpf "0123456789"

Scenario: Criar contrato sem sucesso
  Given O atleta de cpf "01234567890" já possui contratos cadastrados
  When Eu tento cadastrar um contrato para o atleta de cpf "0123456789"
  Then O sistema não cadastra o contrato para o atleta de cpf "0123456789"