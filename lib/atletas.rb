class Atletas

	attr_reader :nome, :email, :telefone, :data_nascimento, :cpf, :rg, :altura, :peso, :posicao_joga, :categoria, :alojamento_clube


	def initialize(nome, email, telefone, data_nascimento, cpf, rg, altura, peso, posicao_joga, categoria, alojamento_clube)
		@nome = nome
		@email = email
		@telefone = telefone
		@data_nascimento = data_nascimento
		@cpf = cpf
		@rg = rg
		@altura = altura
		@peso = peso
		@posicao_joga = posicao_joga
		@categoria = categoria
		@alojamento_clube = alojamento_clube

	end


	#def mensagemAtualizar
		#message = "Dado(s) atualizado(s) com sucesso!"
		#@output.puts message
	#end


	def self.find_cpf(cpf)

		atletasHash = Hash.new
		out = false
		atletasHash.each do |i|
			if atletasHash[i].cpf == cpf
				out = true
			end
		end
		return out
	end

	def save()
		return Atletas.new
	end


	def adicionarAtleta(atleta)
		atletasHash = Hash.new
		atletasHash.each do |i|
			if find_cpf(atleta.cpf) == false
			atletasHash[i] = atleta
			else
			puts "Atleta existente"
			end
		end
	end

	def atualizar(cpf)
			retorna = false
			@atletas = Atletas.find(params[:cpf])
			if @atleta.atualizar(cpf)
				retorna = true
			end

			return retorna
	end

	def atualizado(cpf)
		atletasHash = Hash.new
		retorno = false
		atletasHash.each do |i|
			if atletasHash[i].cpf == cpf
				if atletasHash[i].atualizar(cpf) == true
					retorno = true
				end
			end
		end
		return retorno
	end


end