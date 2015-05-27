Given(/^estou visualizando a lista de partidas$/) do
  	visit LoginPage
	fill_in "Login", :with => @supervisor.login
	fill_in "Password", :with => @supervisor.password
	visit ListaPartidasPage
end

When(/^eu clico no campo "data"$/) do
	click_button "Data"
end

Then(/^serão exibidas as partidas ordenadas pela sua data$/) do
  	Partida.order;
  	visit ListaPartidasPage;
end



Given(/^estou cadastrando uma partida&/) do |arg1|
	partida = Partida.new("nome", "tag", "data", nil, "descricao")

end

When(/^eu tento confirmar o cadastro de uma partida com campos faltando$/) do
	vazio = partida.temCampoFaltando?
end

Then(/^uma mensagem de erro aparece para o usuário$/) do
	if vazio
		visit CampoFaltandoPartidaPage
	else
		click_button "Cadastra"
	end
end