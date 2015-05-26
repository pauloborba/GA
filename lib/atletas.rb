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

	def find_cpf(cpf)
		atletasHash = Hash.new 
		out = false
		atletasHash.each do |i|
			if atletasHash[i].cpf == cpf
				out = true
			end
		end
		return out
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
end