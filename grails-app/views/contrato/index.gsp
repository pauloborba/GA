<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	<meta charset="UTF-8"/>
	<title>Sistema de gestão de atletas - Contrato</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'contrato.css')}"/>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'contrato_index.css')}"/>
	<script src="${resource(dir: 'js', file: 'vue.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'moment-with-locales.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery-3.1.1.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.mask.js')}"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div id="menucontratos" class="columns col-sm-3 col-md-3 col-lg-3">
			<ul>
				<li><a href="/GA/contrato/">Novo contrato</a></li>
				<li><a href="/GA/contrato/novo">Procurar contrato</a></li>
			</ul>
		</div>
		<div id="novocontrato" class="columns col-sm-9 col-md-9 col-lg-9">
			<h2>Novo Contrato</h2>
			<form action="/GA/contrato/novo" method="POST">
				<div class="form-group row">
					<label for="txt_atleta" class="col-xs-2 col-form-label">Nome do Atleta:</label>
					<div class="col-xs-10">
						<input type="text" name="txt_atleta" class="form-control" autofocus="true"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="txt_cpf" class="col-xs-2 col-form-label">CPF:</label>
					<div class="col-xs-4">
						<input type="text" name="txt_cpf" class="form-control" readonly="true"/>
					</div>
					<label for="txt_nascimento" class="col-xs-2 col-form-label">Nascimento:</label>
					<div class="col-xs-4">
						<input type="text" name="txt_nascimento" class="form-control" readonly="true"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="txt_salario" class="col-xs-2 col-form-label">Salário:</label>
					<div class="col-xs-4">
						<input type="number" step="0.01" name="txt_salario" class="form-control"/>
					</div>
					<label for="txt_vigencia" class="col-xs-2 col-form-label">Vigência (em mêses):</label>
					<div class="col-xs-4">
						<input type="number" value="12" name="txt_vigencia" v-model="meses" class="form-control"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="txt_datainicio" class="col-xs-2 col-form-label">Período</label>
					<div class="col-xs-4">
						<input type="text" name="txt_datainicio" placeholder="dd/mm/aaaa" v-model="datainicial" class="datainput form-control"/>
					</div>
					<label for="txt_datafinal" class="col-xs-2 col-form-label">Até</label>
					<div class="col-xs-4">
						<input type="text" name="txt_datafinal" v-model="datafinal" class="form-control" readonly="true"/>
					</div>
				</div>
				<div class="form-check">
					<label class="col-form-label">Cláusulas</label><br/><br/>
					<div class="form-check">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input"/>$1 - Ao marcar gols em 3 partidas seguidas ganha um aumento de 3%
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input"/>$2 - Outra cláusula
						</label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Cadastrar</button>
			</form>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.datainput').mask('00/00/0000');
	});

	var v = new Vue({
		el: '#novocontrato',
		data: {
			datainicial: "",
			meses: 12
		},
		computed: {
			datafinal: function () {
				var patt = new RegExp("[0-9]{2}/[0-9]{2}/[0-9]{4}");
				if (patt.test(this.datainicial) && this.meses != '' && this.meses != null && this.meses > 0) {
					var data = moment(this.datainicial, "DD/MM/YYYY");
					var datafim = moment(data, "DD/MM/YYYY").add(this.meses, 'months');
					return datafim.format("DD/MM/YYYY");
				} else {
					return "";
				}
			}
		}
	});
</script>
</body>
</html>