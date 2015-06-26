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
		partidas_hash = Hash.new
		out = false
		partidas_hash.each do |i|
			if partidas_hash[i].data == data && partidas_hash[i].nome == nome && partidas_hash[i].tag == tag
				out = true
			end
		end

		out
	end

	def self.find_partida(data, nome, tag)
		partidas_hash = Hash.new
		retorno = nil
		partidas_hash.each do |i|
			if partidas_hash[i].data == data && partidas_hash[i].nome == nome && partidas_hash[i].tag == tag
				retorno = partidas_hash[i]
			end
		end
		return retorno
	end

	def adicionar_partida(data, nome, tag)
		novo(data, nome, tag)
	end

	def self.create_partida(data, nome, tag)
		novo(data, nome, tag)
	end

	def self.list_partidas
		partidas_hash = Hash.new
		list_partidas = Array.new
		partidas_hash.each do |i|
			list_partidas.push(partidas_hash[i])
		end

		return list_partidas
	end


	private
		# Trecho do codigo está sendo utilizado duplicado #
		def
			self.novo(data, nome, tag)
				partidas_hash = Hash.new
				partidas_hash.each do |i|
					if !find(data, nome, tag)
						partidas_hash[i] = Partida.new(:data => data,
																					:nome => nome,
																					:tag => tag)
						return true
					else #não adicionou
						return false
					end
				end
		end
end
