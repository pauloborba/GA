
<%@ page import="ga.Notificacao" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'notificacao.label', default: 'Notificacao')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="row">
			<div class="col-md-offset-2 col-md-10">
				<g:if test="${flash.message}">
					<div class="alert alert-success" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${notificacaoInstance}">

					<div class="alert alert-danger">
						<g:eachError bean="${notificacaoInstance}" var="error">
							<p><g:message error="${error}"/></p>
						</g:eachError>
					</div>
				</g:hasErrors>
			</div>
		</div>
		<table border="1" class="table table-striped">
			<thead>
			<tr>

				<g:sortableColumn property="assunto" title="${message(code: 'usuario.nome.label', default: 'Assunto')}" />

				<g:sortableColumn property="descricao" title="${message(code: 'usuario.email.label', default: 'Descricao')}" />

				<g:sortableColumn property="data_notificacao" title="${message(code: 'usuario.clausula_gols.label', default: 'Data da Notificacao')}" />

				<g:sortableColumn property="lida" title="${message(code: 'usuario.clausula_gols.label', default: 'Lida')}" />

			</tr>
			</thead>
			<tbody>
			<g:each in="${notificacaoInstanceList}" status="i" var="usuarioInstance">
				<tr>

					<td>${fieldValue(bean: notificacaoInstance, field: "assunto")}</td>

					<td>${fieldValue(bean: notificacaoInstance, field: "descricao")}</td>

					<td>${fieldValue(bean: notificacaoInstance, field: "data_notificacao")}</td>

					<td><g:formatBoolean boolean="${usuarioInstance.lida}" /></td>

				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${notificacaoInstance ?: 0}" />
		</div>
	</div>
</div>
</body>
</html>
