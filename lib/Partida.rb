class Partida


	attr_reader :data, :nome, :tag, :placar, :descricao


	def intialize(data, nome, tag, placar, descricao)
		@data = data
		@nome = nome
		@tag = tag
		@placar = placar
		@descricao = descricao
	end

	def find(data, nome, tag)
		partidasHash = Hash.new
		out = false
		partidasHash.each do |i|
			if partidasHash[i].data == data && partidasHash[i].nome == nome && partidasHash[i].tag == tag
				out = true
			end
		end
		return out
	end

	def self.find_partida(data, nome, tag)
		partidasHash = Hash.new
		retorno = nil
		partidasHash.each do |i|
			if partidasHash[i].data == data && partidasHash[i].nome == nome && partidasHash[i].tag == tag
				retorno = partidasHash[i]
			end
		end
		return retorno
	end

	def adicionarPartida(data, nome, tag)
		partidasHash = Hash.new
		partidasHash.each do |i|
			if find(data, nome, tag) == false
				partidasHash[i] = Partida.new(data, nome, tag)
				return true
			else #não adicionou
				return false
			end
		end
	end

	def self.create_partida(data, nome, tag)
		partidasHash = Hash.new
		partidasHash.each do |i|
			if find(data, nome, tag) == false
				partidasHash[i] = Partida.new(data, nome, tag)
				return true
			else #não adicionou
				return false
			end
		end
	end

	def self.listPartidas()
		partidasHash = Hash.new
		listPartidas = Array.new
		partidasHash.each do |i|
			listPartidas.push(partidasHash[i])
		end

		return listPartidas
	end
end
