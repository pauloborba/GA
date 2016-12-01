<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8"/>
    <title>
      <g:message code="main.title"></g:message> |
      <g:message code="jogador.novo.title"></g:message>
    </title>
    <asset:stylesheet href="jogador_novo.css"></asset:stylesheet>
  </head>
  <body>
    <h2>
      <g:message code="jogador.novo.title"></g:message>
    </h2><br/>
    <g:if test="${sucesso == true}">
      <div class="alert alert-success">
        <g:message code="jogador.novo.success"></g:message>
      </div>
    </g:if>
    <g:if test="${sucesso == false}">
      <div class="alert alert-danger">${flash.error}</div>
    </g:if>
  </body>
</html>