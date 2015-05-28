class Partida
	attr_reader :data, :nome, :tag, :placar, :descricao, :order, :output

	def intialize(data, nome, tag, placar, descricao, output)
		@data = data
		@nome = nome
		@tag = tag
		@placar = placar
		@descricao = descricao
		@output = output
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

	def adicionarPartida(data, nome, tag, placar, descricao, output)
		partidasHash = Hash.new
		partidasHash.each do |i|
			if find(data, nome, tag) == false
				partidasHash[i] = Partida.new(data, nome, tag, placar, descricao, output)
				return true
			else #não adicionou
				return false
			end
		end
	end

	def temCampoFaltando?(output)
		out = false;
		if @nome.nil?
			out = true
		elsif @tag.nil? 
			out = true
		elsif @data.nil?
			out = true
		elsif @placar.nil?
			out = true
		elsif @descricao.nil?
			out = true
		end

		if out == true
			error_message = "Partida nao sera cadastrada"
			output.puts error_message
		end
		return out
	end

	def valida?
		out = true
		if hasNumber?(@nome)
			out = false
		end

		if out == false
			error_message = "Partida nao sera cadastrada"
			output.puts error_message
		end
		return out
	end

	def hasNumber?(nome)
    	true if Float(nome) rescue false
	end
end
