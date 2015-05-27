#require 'spec-helper'
require 'atletas'


describe Atletas do
	describe "find_cpf" do
		it "Procura cpf" do
			nome = double("output")
			email = double("email")
			telefone = double("telefone")
			data_nascimento = double("data_nascimento")
			cpf = double("cpf")
			rg = double("rg")
			altura = double("altura")
			peso = double("peso")
			posicao_joga = double("posicao_joga")
			categoria = double("categoria")
			alojamento_clube = double("alojamento_clube")
			atleta = Atletas.new(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
			retorno = atleta.find_cpf(cpf)
			retorno == true

		end
	end
end

describe Atletas do
	describe "atualizar"do
		it "Atualizar dado" do
			nome = double("output")
			email = double("email")
			telefone = double("telefone")
			data_nascimento = double("data_nascimento")
			cpf = double("cpf")
			rg = double("rg")
			altura = double("altura")
			peso = double("peso")
			posicao_joga = double("posicao_joga")
			categoria = double("categoria")
			alojamento_clube = double("alojamento_clube")
			atleta = Atletas.new(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
			retorna = atleta.atualizar(cpf)
			retorna == true
			

		end
	end
end

describe Atletas do
	describe "atualizado" do
		it "retorno de atleta atualizado" do
			nome = double("output")
			email = double("email")
			telefone = double("telefone")
			data_nascimento = double("data_nascimento")
			cpf = double("cpf")
			rg = double("rg")
			altura = double("altura")
			peso = double("peso")
			posicao_joga = double("posicao_joga")
			categoria = double("categoria")
			alojamento_clube = double("alojamento_clube")
			atleta = Atletas.new(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
			retorna = atleta.atualizado(cpf)
			retorna == true

		end
	end
end






 