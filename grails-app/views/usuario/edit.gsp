<%@ page import="ga.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
				<div class="row">
				<g:form class="form-horizontal" url="[resource:usuarioInstance, action:'update']" method="PUT" >
						<g:render template="form"/>
						<div class="form-group">
							<div class="col-md-offset-2 col-md-10">
								<g:actionSubmit class="btn btn-success btn-raised" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							</div>
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
