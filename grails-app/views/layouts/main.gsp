<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8"/>
	<title>
		<g:layoutTitle default="Gestão de Atletas"></g:layoutTitle>
	</title>
	<link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'bootstrap/bootstrap.css')}"/>
	<link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'main.css')}"/>
	<g:layoutHead></g:layoutHead>
</head>
<body>
<header>
	<div id="logo" class="container-fluid">
		<div id="logo-inside" class="row">
			<div class="columns col-sm-12 col-md-12 col-lg-12"><img src="${resource(dir: 'images', file: 'layout/ga.png')}" alt=""/></div>
		</div>
	</div>
	<div id="menu" class="container-fluid">
		<div id="menu-inside" class="row">
			<div class="columns col-sm-12 col-md-12 col-lg-12">
				<ul>
					<li>
						<g:if test="${controllerName == null}"><a href="/GA" class="ativado">Home</a></g:if>
						<g:else><a href="/GA">Home</a></g:else>
					</li>
					<li>
						<g:if test="${controllerName == 'jogador'}"><a href="/GA/jogador" class="ativado">Jogadores</a></g:if>
						<g:else><a href="/GA/jogador">Jogadores</a></g:else>
					</li>
					<li>
						<g:if test="${controllerName == 'contrato'}"><a href="/GA/contrato" class="ativado">Contratos</a></g:if>
						<g:else><a href="/GA/contrato">Contratos</a></g:else>
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