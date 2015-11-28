
<%@ page import="ga.Contrato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contrato.label', default: 'Contrato')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contrato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contrato" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="contratado" title="${message(code: 'contrato.contratado.label', default: 'Contratado')}" />
					
						<g:sortableColumn property="contratante" title="${message(code: 'contrato.contratante.label', default: 'Contratante')}" />
					
						<g:sortableColumn property="data_inicio" title="${message(code: 'contrato.data_inicio.label', default: 'Datainicio')}" />
					
						<g:sortableColumn property="data_termino" title="${message(code: 'contrato.data_termino.label', default: 'Datatermino')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'contrato.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contratoInstanceList}" status="i" var="contratoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contratoInstance.id}">${fieldValue(bean: contratoInstance, field: "contratado")}</g:link></td>
					
						<td>${fieldValue(bean: contratoInstance, field: "contratante")}</td>
					
						<td>${fieldValue(bean: contratoInstance, field: "data_inicio")}</td>
					
						<td>${fieldValue(bean: contratoInstance, field: "data_termino")}</td>
					
						<td>${fieldValue(bean: contratoInstance, field: "valor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contratoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
