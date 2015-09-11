scenario: cancelamento de contrato

given 	o sistema tem um contrato com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2016" salvo com nome "C-10-10.pdf"
when 	eu deleto o contrato de jogador "Carlos" do periodo de "10/10/2010" até"10/10/2016"
then 	o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2016" é corretamente removido do sistema


scenario: cancelamento de contrato com prazo expirado

given 	o sistema tem um contrato com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2012" salvo com nome "C-10-10.pdf"
when 	eu deleto o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2012"
then 	o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2012" não é removido por que não é possivel remover um 			contrato com prazo expirado


scenario: cancelamento de contrato GUI

given	eu estou na pagina de vizualização de contratos
and		tem o sistema tem apenas um contrato armazenado com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2016"
when	eu dou um click para remover o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2016"
then	a mensagem de confirmação do cancelamento "o contrato foi removido com sucesso" é mostrada


scenario: cancelamento de contrato com prazo expirado GUI

given	eu estou na pagina de vizualização de contratos
and		tem o sistema tem apenas um contrato armazenado com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2016"
when	eu dou um click para remover o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2016"
then	a mensagem de erro do cancelamento "não é possivel remover contrato com data expirada" é mostrada


