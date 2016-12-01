<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8"/>
    <title>
      <g:message code="main.title"></g:message> |
      <g:message code="jogador.procurar.title"></g:message>
    </title>
    <asset:stylesheet href="jogador_procurar.css"></asset:stylesheet>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div id="procurar" class="columns col-sm-12 col-md-12 col-lg-12">
          <h2>
            <g:message code="jogador.procurar.title"></g:message>
          </h2>
        </div>
      </div>
      <form action="/GA/jogador/procurar" method="GET">
        <div class="form-group row">
          <label for="txt_atleta" class="col-xs-2 col-form-label">
            <g:message code="jogador.atributos.namefull"></g:message>:
          </label>
          <div class="col-xs-8">
            <input id="txt_atleta" type="text" name="atleta" class="form-control" autofocus="true"/>
          </div>
          <div class="col-xs-2">
            <input type="submit" name="btnpesquisar" value="<g:message code='jogador.procurar.btnsearch' />" class="btn btn-primary"/>
          </div>
        </div>
      </form>
      <div class="row">
        <table class="table">
          <thead>
            <tr>
              <th>
                <g:message code="jogador.atributos.name"></g:message>
              </th>
              <th>
                <g:message code="jogador.atributos.cpf"></g:message>
              </th>
              <th>
                <g:message code="jogador.atributos.position"></g:message>
              </th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <g:if test="${jogadores != null}">
              <g:if test="${jogadores.size > 0}">
                <g:each var="jogador" in="${jogadores}">
                  <tr>
                    <td>${jogador.nome}</td>
                    <td>${jogador.cpf}</td>
                    <td>${jogador.posicao}</td>
                    <td class="col-xs-1"><a href="/GA/jogador/editar?id=${jogador.id}" class="btn btn-primary">
                        <g:message code="jogador.procurar.btnedit"></g:message></a></td>
                    <td class="col-xs-1"><a href="/GA/jogador/excluir?id=${jogador.id}" class="btn btn-danger">
                        <g:message code="jogador.procurar.btnremove"></g:message></a></td>
                  </tr>
                </g:each>
              </g:if>
            </g:if>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>