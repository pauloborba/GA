<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8"/>
    <title>
      <g:message code="main.title"></g:message> |
      <g:message code="contrato.cadastrar.title"></g:message>
    </title>
    <asset:stylesheet href="contrato.css"></asset:stylesheet>
    <asset:stylesheet href="contrato_index.css"></asset:stylesheet>
    <asset:javascript src="moment-with-locales.min.js"></asset:javascript>
    <asset:javascript src="jquery.mask.js"></asset:javascript>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div id="novocontrato" class="columns col-sm-12 col-md-12 col-lg-12">
          <h2>
            <g:message code="contrato.cadastrar.title"></g:message>
          </h2>
          <form action="/GA/contrato/novo" method="POST">
            <div class="form-group row">
              <label for="txt_atleta" class="col-xs-2 col-form-label"> 
                <g:message code="jogador.atributos.namefull"></g:message>:
              </label>
              <div v-bind:class="{'has-error': (jogadoresfiltro.length==0 &amp;&amp; filtro !='')}" class="col-xs-10 form-group">
                <input type="text" name="txt_atleta" autocomplete="off" v-model="filtro" v-on:keyup="filtra();selecionado = false;" v-on:keyup.13="submit($event)" v-on:keyup.38="$event.preventDefault(); keyUp();" v-on:keyup.40="keyDown()" v-on:keypress.13="$event.preventDefault()" v-on:keypress.38="$event.preventDefault()" v-on:keydown.38="$event.preventDefault()" class="form-control" autofocus="true"/>
                <div v-bind:style="{display: (jogadoresfiltro.length == 0 || selecionado) ? 'none' : 'block'}" class="lista_atletas">
                  <div id="listatamfix">
                    <ul>
                      <li v-for="(jogador, key) in jogadoresfiltro" v-bind:class="{ selecionado: key == jogadorselecionado }"><a v-on:mouseover="seleciona(key)" v-on:click="pick()">{{ jogador.nome }}</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group row">
              <label for="txt_cpf" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.cpf"></g:message>:
              </label>
              <div class="col-xs-4">
                <input type="text" name="txt_cpf" v-model="jogadorform.cpf" class="form-control cpfinput" readonly="true"/>
              </div>
              <label for="txt_nascimento" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.birthday"></g:message>:
              </label>
              <div class="col-xs-4">
                <input type="text" name="txt_nascimento" v-model="jogadorform.nascimento" class="form-control" readonly="true"/>
              </div>
            </div>
            <div class="form-group row">
              <label for="txt_salario" class="col-xs-2 col-form-label">
                <g:message code="contrato.atributos.salary"></g:message>:
              </label>
              <div class="col-xs-4">
                <input type="text" name="txt_salario" class="form-control"/>
              </div>
              <label for="txt_vigencia" class="col-xs-2 col-form-label">
                <g:message code="contrato.cadastrar.validity"></g:message>:
              </label>
              <div class="col-xs-4">
                <input type="text" value="12" name="txt_vigencia" v-model="meses" class="form-control"/>
              </div>
            </div>
            <div class="form-group row">
              <label for="txt_datainicio" class="col-xs-2 col-form-label">
                <g:message code="contrato.atributos.duration"></g:message>:
              </label>
              <div class="col-xs-4">
                <input type="text" name="txt_datainicio" placeholder="dd/mm/aaaa" v-model="datainicial" class="datainput form-control"/>
              </div>
              <label for="txt_datafinal" class="col-xs-2 col-form-label">
                <g:message code="contrato.atributos.duration2"></g:message>:
              </label>
              <div class="col-xs-4">
                <input type="text" name="txt_datafinal" v-model="datafinal" class="form-control" readonly="true"/>
              </div>
            </div>
            <div class="form-check">
              <label class="col-form-label">
                <g:message code="contrato.atributos.clauses"></g:message>
              </label><br/><br/>
              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" name="clausulas[]" class="form-check-input"/>$1 - 
                  <g:message code="contrato.atributos.clauses.1"></g:message>
                </label>
              </div>
              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" name="clausulas[]" class="form-check-input"/>$2 - 
                  <g:message code="contrato.atributos.clauses.2"></g:message>
                </label>
              </div>
            </div>
            <input type="submit" name="btncadastrar" value="Cadastrar" class="btn btn-primary"/>
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
      		meses: 12,
      		jogadores: [
      		],
      		jogadorform: {
      			nome: "",
      			cpf: "",
      			nascimento: ""
      		},
      		jogadoresfiltro: [],
      		jogadorselecionado: -1,
      		selecionado: false,
      		filtro: ""
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
      	},
      	methods: {
      		filtra: function() {
      			self = this;
      			this.jogadorform = {nome: "", cpf: "", nascimento: ""}
      			if(this.filtro != "") {
      				this.jogadoresfiltro = this.jogadores.filter(function(jogador) {
      					return jogador.nome.toLowerCase().startsWith(self.filtro.toLowerCase());
      				});
      			} else {
      				this.jogadorselecionado = -1
      				this.jogadoresfiltro = []
      			}
      		},
      		seleciona: function(indice) {
      			this.jogadorselecionado = indice;
      		},
      		keyUp:function() {
      			this.jogadorselecionado -= (this.jogadorselecionado > 0) ? 1 : 0;
      			$('input[name=txt_atleta]')[0].setSelectionRange(this.filtro.length, this.filtro.length);
      		},
      		keyDown: function() {
      			this.jogadorselecionado += (this.jogadorselecionado < (this.jogadoresfiltro.length - 1)) ? 1 : 0;
      		},
      		submit: function(event) {
      			event.preventDefault();
      			this.pick();
      		},
      		pick: function() {
      			if(this.jogadorselecionado != -1) {
      				this.filtro = this.jogadoresfiltro[this.jogadorselecionado].nome;
      
      				if(this.jogadoresfiltro.length > 0) {
      					this.selecionado = true;
      					this.jogadorform = this.jogadoresfiltro[this.jogadorselecionado];
      					this.jogadorselecionado = -1;
      				}
      			}
      		}
      	},
      	created: function() {
      		var jogadores = ${jogadores};
      		
      		for(var i = 0; i < jogadores.length; i++) {
      			jogadores[i].nascimento = 
      			jogadores[i].dataDeNascimento.slice(8, 10) + "/" + 
      			jogadores[i].dataDeNascimento.slice(5, 7) + "/" +
      			jogadores[i].dataDeNascimento.slice(0, 4);
      		}
      		this.jogadores = jogadores;
      	}
      });
    </script>
  </body>
</html>
