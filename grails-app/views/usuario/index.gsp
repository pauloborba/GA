
<%@ page import="ga.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-6 col-md-offset-2 text-center">
				<h2>Notificaçoes</h2>
			</br>
			</br>
			</div>
		</div>


		<div class="form-group">
			<div class="col-md-offset-2 col-md-10">
				<g:link class="btn btn-success btn-raised" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
		</div>
		</br>
		</br>
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<div class="row">
					<div class="col-md-offset-2 col-md-10">
						<g:if test="${flash.message}">
							<div class="alert alert-success" role="status">${flash.message}</div>
						</g:if>
						<g:hasErrors bean="${usuarioInstance}">

							<div class="alert alert-danger">
								<g:eachError bean="${usuarioInstance}" var="error">
									<p><g:message error="${error}"/></p>
								%{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
								</g:eachError>
							</div>
						</g:hasErrors>
					</div>
				</div>
			<table border="1" class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="clausula_gols" title="${message(code: 'usuario.clausula_gols.label', default: 'Clausula de Quantidade de gols')}" />
					
						<g:sortableColumn property="contrato_expira" title="${message(code: 'usuario.contrato_expira.label', default: 'Contrato perto de acabar')}" />

						<g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Editar')}"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr>
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.clausula_gols}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.contrato_expira}" /></td>
						<td><g:link action="edit" id="${usuarioInstance.id}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</div>
	</body>
</html>
