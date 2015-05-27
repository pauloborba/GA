require 'spec_helper'
require 'atletas'

describe Atletas do
	describe "find_cpf" do
		it "verificar existencia de cpf" do
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
			resul = atleta.find_cpf(cpf)
			resul == false

		end
	end
end


describe Atletas do
	describe "adicionarAtleta" do
		it "adicionar atleta novo" do
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
			atleta.adicionarAtleta(cpf)

		end
	end
end

describe Atletas do
	describe "find_cpf" do
		it "confirmar que usuario foi adicionado" do
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
			resul1 = atleta.find_cpf(cpf)
			resul1 == true

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
