<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8"/>
    <title>
      <g:message code="main.title"></g:message> |
      <g:message code="jogador.cadastrar.title"></g:message>
    </title>
    <asset:stylesheet href="jogador_cadastro.css"></asset:stylesheet>
    <asset:javascript src="jquery.mask.js"></asset:javascript>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div id="novojogador" class="columns col-sm-12 col-md-12 col-lg-12">
          <h2>
            <g:message code="jogador.cadastrar.title"></g:message>
          </h2>
          <form action="/GA/jogador/novo" method="POST">
            <div class="form-group row">
              <label for="txt_atleta" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.namefull"></g:message>:
              </label>
              <div class="col-xs-10">
                <input id="txt_atleta" type="text" name="txt_atleta" class="form-control" autofocus="true"/>
              </div>
            </div>
            <div class="form-group row">
              <label for="txt_cpf" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.cpf"></g:message>:
              </label>
              <div class="col-xs-4">
                <input id="txt_cpf" type="text" name="txt_cpf" class="form-control cpfinput"/>
              </div>
              <label for="txt_nascimento" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.birthday"></g:message>:
              </label>
              <div class="col-xs-4">
                <input id="txt_nascimento" type="text" name="txt_nascimento" class="form-control datainput"/>
              </div>
            </div>
            <div class="form-group row">
              <label for="select_posicao" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.position"></g:message>:
              </label>
              <div class="col-xs-4">
                <select id="select_posicao" name="select_posicao" class="form-control">
                  <g:each var="posicao" in="${posicoes}">
                    <option>${posicao}</option>
                  </g:each>
                </select>
              </div>
            </div>
            <input id="btncadastrar" type="submit" name="cadastrar" value="<g:message code='jogador.cadastrar.btnsubmit' />" class="btn btn-primary"/>
          </form>
        </div>
      </div>
    </div>
    <script>
      $(document).ready(function(){
      	$('.datainput').mask('00/00/0000');
      	$('.cpfinput').mask('999.999.999-99');
      });
    </script>
  </body>
</html>