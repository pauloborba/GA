class Partida

	def initialize(nome, tag, data, placar, descricao)
		@nome = nome
		@tag = tag
		@data = data
		@placar = placar
		@descricao = descricao
		@order = false
	end

	def temCampoFaltando?
		if @nome.nil?
			return true
		elsif @tag.nil? 
			return true
		elsif @data.nil?
			return true
		elsif @placar.nil?
			return true
		elsif @descricao.nil?
			return true
		else
			return false
		end
	end

	def order
		partidaHash = Hash.new
		partidaHash[@nome] = Partida.new(@nome, @tag, @data, @placar, @descricao)
		partidaHash["teste"] = Partida.new("teste", "tag", "14/04/1995", "placar", "descricao")
		if @order == false
			partidaHash.sort{
				|x, y| if x.data > y.data
				 x <=> y 
				end
			}
			@order = true
		else
			partidaHash.reverse{
				|x, y| if x.data < y.data
					x <=> y 
				end
			}
			@order = false
		end
	end
end