class AtletaTestAndDataOperations {

	static article[]

	static public def findByCpf(String cpf) {
		atletas.find { atleta ->
			atleta.cpf == cpf			
	}		

	static public void createAtleta(String nome, String cpf) {
        def cont = new AtletaController()
        cont.params << findAtletaByCpf(cpf) 
        			//<< [file: filename]
        cont.request.setContent(new byte[1000])
        cont.create()
        cont.save()
        cont.response.reset()
    }

}

