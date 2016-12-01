<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8"/>
    <title>
        <g:message code="main.title"></g:message> |
        <g:message code="partida.cadastrar.title"></g:message>
    </title>
    <asset:stylesheet href="partida_cadastro.css"></asset:stylesheet>
    <asset:javascript src="jquery.mask.js"></asset:javascript>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div id="novapartida" class="columns col-sm-12 col-md-12 col-lg-12">
            <h2>
                <g:message code="partida.cadastrar.title"></g:message>
            </h2>
            <form action="/GA/partida/nova" method="POST">
                <div class="form-group row">
                    <label for="txt_adversario" class="col-xs-2 col-form-label">
                        <g:message code="partida.atributos.opponent"></g:message>:
                    </label>
                    <div class="col-xs-4">
                        <input id="txt_adversario" type="text" name="txt_adversario" class="form-control" autofocus="true"/>
                    </div>
                    <label for="txt_gols_sofridos" class="col-xs-2 col-form-label">
                        <g:message code="partida.atributos.goalsconceded"></g:message>:
                    </label>
                    <div class="col-xs-2">
                        <input id="txt_gols_sofridos" type="number" name="txt_gols_sofridos" value="0" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txt_data" class="col-xs-2 col-form-label">
                        <g:message code="partida.atributos.date"></g:message>:
                    </label>
                    <div class="col-xs-2">
                        <input id="txt_data" type="text" name="txt_data" placeholder="dd/mm/aaaa" class="form-control datainput"/>
                    </div>
                </div>
                <h3>
                    <g:message code="partida.cadastrar.escalation"></g:message>
                </h3>
                <table class="table">
                    <thead class="thead-inverse">
                    <tr>
                        <th>#</th>
                        <th>
                            <g:message code="jogador.self"></g:message>
                        </th>
                        <th>
                            <g:message code="jogador.atributos.position"></g:message>
                        </th>
                        <th>
                            <g:message code="jogador.atributos.goals"></g:message>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(jogador, key) in jogadores" v-bind:class="{ selecionado: jogador.selecionado, naoselecionado: !jogador.selecionado }">
                        <td v-on:click="seleciona(key)" class="col-xs-2"><span v-if="jogador.selecionado">
                            <g:message code="partida.cadastrar.holder"></g:message></span><span v-else="v-else">
                            <g:message code="partida.cadastrar.reserve"></g:message></span></td>
                        <td v-on:click="seleciona(key)">{{ jogador.nome }}</td>
                        <td v-on:click="seleciona(key)">{{ jogador.posicao }}</td>
                        <td v-if="jogador.selecionado" class="col-xs-2">
                            <input type="hidden" name="jogadortitular[]" v-model="jogador.cpf"/>
                            <input type="number" name="gols[]" value="0" class="form-control"/>
                        </td>
                        <td v-else="v-else" v-on:click="seleciona(key)" class="col-xs-2">
                            <input type="hidden" name="jogador_reserva[]" v-model="jogador.cpf"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="submit" name="btncadastrar" value="<g:message code='partida.cadastrar.brnsubmit' />" class="btn btn-primary"/>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.datainput').mask('00/00/0000');
    });

    var v = new Vue({
        el: '#novapartida',
        data: {
            jogadores: []
        },
        methods: {
            seleciona: function(key) {
                this.jogadores[key].selecionado = !this.jogadores[key].selecionado;
            }
        },
        created: function() {
            var jogadores = ${jogadores}
            for(var i = 0; i < jogadores.length; i++) {
                jogadores[i].selecionado = false;
                this.jogadores.push(jogadores[i]);
            }
        }
    })
</script>
</body>
</html>