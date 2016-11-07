
<%@ page import="ga.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-6 col-md-offset-2 text-center">
				<h2>Notificaçoes</h2>
			</br>
			</br>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
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

				<g:if test="${usuarioInstance?.nome}">
					<div class="row">
						<label class="col-md-4">
							<g:message code="usuario.nome.label" default="Nome" />:
						</label>
						<p class="col-md-8">
							<g:fieldValue bean="${usuarioInstance}" field="nome"/>
						</p>
					</div>
				</g:if>

				<g:if test="${usuarioInstance?.email}">
					<div class="row">
						<label class="col-md-4">
							<g:message code="usuario.email.label" default="Email" />:
						</label>
						<p class="col-md-8">
							<g:fieldValue bean="${usuarioInstance}" field="email"/>
						</p>
					</div>
				</g:if>

				<g:if test="${usuarioInstance?.clausula_gols}">
					<div class="row">
						<label class="col-md-4">
							<g:message code="usuario.clausula_gols.label" default="Clausula de Quantidade de gols" />:
						</label>
						<p class="col-md-8">
							<g:formatBoolean boolean="${usuarioInstance?.clausula_gols}" />
						</p>
					</div>
				</g:if>

				<g:if test="${usuarioInstance?.contrato_expira}">
					<div class="row">
						<label class="col-md-4">
							<g:message code="usuario.contrato_expira.label" default="Contrato perto de acabar" />:
						</label>
						<p class="col-md-8">
							<g:formatBoolean boolean="${usuarioInstance?.contrato_expira}" />
						</p>
					</div>
				</g:if>

				<div class="row">
					<div class="col-md-offset-4 col-md-8">
						<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
							<g:link class="btn btn-success btn-raised" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="btn btn-danger btn-raised" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
