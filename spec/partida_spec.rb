#encoding: UTF-8

require 'spec_helper'
require 'partida'

describe Partida do
	describe "find" do
		it "verificar existencia de partida" do
			data = double("output")
			nome = double("nome")
			tag = double("tag")
			partida = Partida.new("data", "nome", "Tag")
			find = partida.find(arg1,arg2,arg3)
			find == true
		end
	end
end

describe Partida do 
	describe "adiocionarPartida" do
		it "adicionar partida nova" do
			data = double("output")
			nome = double("nome")
			tag = double("tag")
			partida = Partida.new("data", "nome", "Tag")
	 		atleta.adicionarPartida(arg1, arg2, arg3)
	 	end
 	end
end

describe Partida do
	describe "find" do
		it "verificar existencia de partida" do
			data = double("output")
			nome = double("nome")
			tag = double("tag")
			partida = Partida.new("data", "nome", "tag")
  			partida.adicionarPartida(arg1, arg2, arg3)
		end
	end
end