<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <title>
      <g:layoutTitle default="Gestão de Atletas"></g:layoutTitle>
    </title>
    <asset:stylesheet href="bootstrap/bootstrap.css"></asset:stylesheet>
    <asset:stylesheet href="main.css"></asset:stylesheet>
    <asset:javascript src="jquery-3.1.1.min.js"></asset:javascript>
    <asset:javascript src="vue.min.js"></asset:javascript>
    <g:layoutHead></g:layoutHead>
  </head>
  <body>
    <header>
      <div id="logo" class="container-fluid">
        <div id="logo-inside" class="row">
          <div style="position: relative;" class="columns col-sm-12 col-md-12 col-lg-12">
            <asset:image src="layout/ga.png"></asset:image>
          </div>
        </div>
      </div>
      <div id="menu" class="container-fluid">
        <div id="menu-inside" class="row">
          <div class="columns col-sm-12 col-md-12 col-lg-12">
            <ul class="menu">
              <li>
                <g:if test="${controllerName == null}"><a href="/GA" class="ativado">
                    <g:message code="main.menu.home"></g:message></a></g:if>
                <g:else><a href="/GA">
                    <g:message code="main.menu.home"></g:message></a></g:else>
              </li>
              <li>
                <g:if test="${controllerName == 'jogador'}"><a href="#" class="ativado">
                    <g:message code="main.menu.players"></g:message></a></g:if>
                <g:else><a href="#">
                    <g:message code="main.menu.players"></g:message></a></g:else>
                <ul class="submenu">
                  <li> <a href="/GA/jogador/cadastro">
                      <g:message code="main.menu.newplayer"></g:message></a></li>
                  <li> <a href="/GA/jogador/procurar">
                      <g:message code="main.menu.searchplayer"></g:message></a></li>
                </ul>
              </li>
              <li>
                <g:if test="${controllerName == 'contrato'}"><a href="#" class="ativado">
                    <g:message code="main.menu.contract"></g:message></a></g:if>
                <g:else><a href="#">
                    <g:message code="main.menu.contract"></g:message></a></g:else>
                <ul class="submenu">
                  <li> <a href="/GA/contrato/cadastrar">
                      <g:message code="main.menu.newcontract"></g:message></a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <div id="content" class="container-fluid">
      <div id="content-inside" class="row">
        <div class="columns col-sm-12 col-md-12 col-lg-12">
          <g:layoutBody></g:layoutBody>
        </div>
      </div>
    </div>
    <footer>
      <div id="footer-inside" class="row">
        <div class="columns col-sm-12 col-md-12 col-lg-12"></div>
      </div>
    </footer>
  </body>
</html>
