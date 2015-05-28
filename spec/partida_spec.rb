#encoding: UTF-8

require 'spec_helper'
require 'partida'

describe Partida do
	describe "find" do
		it "verificar existencia de partida" do
			data = double("data")
			nome = double("nome")
			tag = double("tag")
			partida = Partida.new()
			find = partida.find(data,nome,tag)
			find == true
		end
	end
end

describe Partida do
	describe "adicionarPartida" do
		it "adicionar nova partida" do
			nome = double("nome")
			tag = double("tag")
			data = double("data")
			placar = double("placar")
			descricao = double("descricao")
			output = double("output")
			partida = Partida.new()
			partida.adicionarPartida(data, nome, tag, placar, descricao, output)
		end
	end
end

describe Partida do
	describe "adiocionarPartida" do
		it "adicionar partida nova ja existente" do
			data = double("data")
			nome = double("nome")
			tag = double("tag")
			partida = Partida.new()
	 		partida.adicionarPartida(data, nome, tag)
	 	end
 	end
end

describe Partida do
	describe "temCampoFaltando?" do
		it "verificar se tem campo faltando" do
			nome = double("nome")
			tag = double("tag")
			data = double("data")
			descricao = double("descricao")
			partida = Partida.new()
			partida.temCampoFaltando?(STDOUT)
		end
	end
end

describe Partida do
	describe "valida?" do
		it "verificar se partida e valida" do
			nome = double("nome123")
			tag = double("tag")
			data = double("data")
			descricao = double("descricao")
			partida = Partida.new()
			partida.valida?
		end
	end
end