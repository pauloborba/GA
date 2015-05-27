class Partida
	

	attr_reader :data, :nome, :tag


	def intialize(data, nome, tag)
		@data = data
		@nome = nome
		@tag = tag
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
end
	