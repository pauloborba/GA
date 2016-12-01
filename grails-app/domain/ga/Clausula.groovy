package ga

class Clausula {

	int numero
	String descricao
	int gols
	double bonus
	static hasMany = [conflitos: Clausula, contratos:Contrato]
	static belongsTo = Contrato

	public Clausula(String descricao, int gols, int numero, double bonus) {
		this.gols = gols
		this.numero = numero
		this.descricao = descricao
		this.bonus = bonus
	}
	
	static constraints = {
		numero blank: false, unique: true
	}
}