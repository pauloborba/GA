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
	describe "adiocionarPartida" do
		it "adicionar partida nova" do
			data = double("data")
			nome = double("nome")
			tag = double("tag")
			partida = Partida.new()
	 		partida.adicionarPartida(data, nome, tag)
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