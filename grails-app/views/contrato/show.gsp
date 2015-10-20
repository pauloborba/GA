
<%@ page import="ga.Contrato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contrato.label', default: 'Contrato')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contrato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contrato" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contrato">
			
				<g:if test="${contratoInstance?.contratado}">
				<li class="fieldcontain">
					<span id="contratado-label" class="property-label"><g:message code="contrato.contratado.label" default="Contratado" /></span>
					
						<span class="property-value" aria-labelledby="contratado-label"><g:fieldValue bean="${contratoInstance}" field="contratado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoInstance?.contratante}">
				<li class="fieldcontain">
					<span id="contratante-label" class="property-label"><g:message code="contrato.contratante.label" default="Contratante" /></span>
					
						<span class="property-value" aria-labelledby="contratante-label"><g:fieldValue bean="${contratoInstance}" field="contratante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoInstance?.data_inicio}">
				<li class="fieldcontain">
					<span id="data_inicio-label" class="property-label"><g:message code="contrato.data_inicio.label" default="Datainicio" /></span>
					
						<span class="property-value" aria-labelledby="data_inicio-label"><g:fieldValue bean="${contratoInstance}" field="data_inicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoInstance?.data_termino}">
				<li class="fieldcontain">
					<span id="data_termino-label" class="property-label"><g:message code="contrato.data_termino.label" default="Datatermino" /></span>
					
						<span class="property-value" aria-labelledby="data_termino-label"><g:fieldValue bean="${contratoInstance}" field="data_termino"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="contrato.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${contratoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contratoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contratoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
