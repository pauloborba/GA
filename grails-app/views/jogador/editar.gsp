<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8"/>
    <title>
      <g:message code="main.title"></g:message> |
      <g:message code="jogador.editar.title"></g:message>
    </title>
    <asset:stylesheet href="jogador_cadastro.css"></asset:stylesheet>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div id="novocontrato" class="columns col-sm-12 col-md-12 col-lg-12">
          <h2>
            <g:message code="jogador.editar.title"></g:message>
          </h2>
          <g:if test="${atualizacao != null && atualizacao == 'true'}">
            <div class="alert alert-success">
              <g:message code="jogador.editar.success"></g:message>
            </div>
          </g:if>
          <form action="/GA/jogador/update?id=${jogador.id}" method="POST">
            <div class="form-group row">
              <label for="txt_atleta" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.namefull"></g:message>:
              </label>
              <div class="col-xs-10">
                <input id="txt_atleta" type="text" name="txt_atleta" value="${jogador.nome}" class="form-control" autofocus="true"/>
              </div>
            </div>
            <div class="form-group row">
              <label for="txt_cpf" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.cpf"></g:message>:
              </label>
              <div class="col-xs-4">
                <input id="txt_cpf" type="text" name="txt_cpf" value="${jogador.cpf}" class="form-control cpfinput"/>
              </div>
              <label for="txt_nascimento" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.birthday"></g:message>:
              </label>
              <div class="col-xs-4">
                <input id="txt_nascimento" type="text" name="txt_nascimento" value="${nascimentoPretty}" class="form-control datainput"/>
              </div>
            </div>
            <div class="form-group row">
              <label for="select_posicao" class="col-xs-2 col-form-label">
                <g:message code="jogador.atributos.position"></g:message>:
              </label>
              <div class="col-xs-4">
                <select id="select_posicao" name="select_posicao" class="form-control">
                  <g:each var="posicao" in="${posicoes}"><option <g:if test="${posicao == jogador.posicao}">selected</g:if>> ${posicao} </option></g:each>
                </select>
              </div>
            </div>
            <input type="submit" name="btnatualizar" value="<g:message code='jogador.editar.btnupdate' />" class="btn btn-primary"/>
          </form>
        </div>
      </div>
    </div>
    <script>
      $(document).ready(function(){
      	$('.datainput').mask('00/00/0000');
      	$('.cpfinput').mask("999.999.999-99");
      });
    </script>
  </body>
</html>