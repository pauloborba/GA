<%@ page import="ga.NotificacaoController" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	<meta charset="UTF-8"/>
	<title>Sistema de gestão de atletas</title>
</head>
<body>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h3>Bem vindo ao sistema de gestão de atletas</h3>
		</div>
	</div>
<header>
	<div id="menu" class="container-fluid">
		<div id="menu-inside" class="row">
			<div class="columns col-md-10 col-md-offset-1">
				<ul class="menu">
					<li><a href="/GA/notificacao/verifica_dias_fim" class="btn btn-default btn-raised">
							<g:message code="main.menu.home"></g:message></a>
					</li>
					<li><a href="/GA/notificacao/verifica_clausula" class="btn btn-default btn-raised">
						<g:message code="main.menu.notification"></g:message></a>
					</li>
					<li><a href="/GA/notificacao/index" class="btn btn-default btn-raised">
						<g:message code="main.menu.notification"></g:message></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>
</body>
</html>