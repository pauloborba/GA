require 'spec_helper'
require 'atletas'

describe Atletas do
	describe "find_cpf" do
		it "verificar existencia de cpf" do
			nome = double("gabriel henrique")
			email = double("ghdr@cin.ufpe.br")
			telefone = double("99878798")
			data_nascimento = double("01/01/91")
			cpf = double("09898787656")
			rg = double("8765667")
			altura = double("1,75cm")
			peso = double("70kg")
			posicao_joga = double("atacante")
			categoria = double("sub 17")
			alojamento_clube = double("sim")
			atleta = Atletas.new(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
			resul = atleta.find_cpf(cpf)
			atleta = Atletas.new("gabriel henrique", "ghdr@cin.ufpe.br", "99878798", "01/01/91", "09898787656", "8765667", "1,75cm", "70kg", "atacante", "sub 17", "sim")

			resul == false

		end
	end
end


describe Atletas do
	describe "adicionarAtleta" do
		it "adicionar atleta novo" do
			nome = double("gabriel henrique")
			email = double("ghdr@cin.ufpe.br")
			telefone = double("99878798")
			data_nascimento = double("01/01/91")
			cpf = double("09898787656")
			rg = double("8765667")
			altura = double("1,75cm")
			peso = double("70kg")
			posicao_joga = double("atacante")
			categoria = double("sub 17")
			alojamento_clube = double("sim")
			atleta = Atletas.new(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
			atleta.adicionarAtleta(cpf)

		end
	end
end

describe Atletas do
	describe "find_cpf" do
		it "confirmar que usuario foi adicionado" do
			nome = double("gabriel henrique")
			email = double("ghdr@cin.ufpe.br")
			telefone = double("99878798")
			data_nascimento = double("01/01/91")
			cpf = double("09898787656")
			rg = double("8765667")
			altura = double("1,75cm")
			peso = double("70kg")
			posicao_joga = double("atacante")
			categoria = double("sub 17")
			alojamento_clube = double("sim")
			atleta = Atletas.new(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
			resul1 = atleta.find_cpf(cpf)
			resul1 == true

		end
	end
end