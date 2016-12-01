
<%@ page import="ga.Jogador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jogador.label', default: 'Jogador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-jogador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-jogador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="cpf" title="${message(code: 'jogador.cpf.label', default: 'Cpf')}" />

						<g:sortableColumn property="nome" title="${message(code: 'jogador.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="dataDeNascimento" title="${message(code: 'jogador.dataDeNascimento.label', default: 'Data De Nascimento')}" />
					
						<g:sortableColumn property="posicao" title="${message(code: 'jogador.posicao.label', default: 'Posicao')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'jogador.ativo.label', default: 'Estado')}" />
					
						<g:sortableColumn property="golsFeitos" title="${message(code: 'jogador.golsFeitos.label', default: 'Gols Feitos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jogadorInstanceList}" status="i" var="jogadorInstance">

					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${jogadorInstance.id}">${fieldValue(bean: jogadorInstance, field: "cpf")}</g:link></td>

						<td>${fieldValue(bean: jogadorInstance, field: "nome")}</td>
					
						<td><g:formatDate date="${jogadorInstance.dataDeNascimento}" /></td>
					
						<td>${fieldValue(bean: jogadorInstance, field: "posicao")}</td>
					
						%{--<td><g:formatBoolean boolean="${jogadorInstance.ativo}" /></td>--}%
						<g:if test="${jogadorInstance?.ativo}">
							<td><p>Ativo</p></td>
						</g:if>
						<g:else>
							<td><p>Inativo</p></td>
						</g:else>


						<td>${fieldValue(bean: jogadorInstance, field: "golsFeitos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${jogadorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
