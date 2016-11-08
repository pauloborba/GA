
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

				<g:if test="${contratoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="contrato.nome.label" default="Nome" /></span>

						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${contratoInstance}" field="nome"/></span>

				</li>
				</g:if>

				<g:if test="${contratoInstance?.jogador}">
				<li class="fieldcontain">
					<span id="jogador-label" class="property-label"><g:message code="contrato.jogador.label" default="Jogador" /></span>

						<span class="property-value" aria-labelledby="jogador-label"><g:link controller="jogador" action="show" id="${contratoInstance?.jogador?.id}">${contratoInstance?.jogador?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${contratoInstance?.salario}">
				<li class="fieldcontain">
					<span id="salario-label" class="property-label"><g:message code="contrato.salario.label" default="Salario" /></span>

						<span class="property-value" aria-labelledby="salario-label"><g:fieldValue bean="${contratoInstance}" field="salario"/></span>

				</li>
				</g:if>

				<g:if test="${contratoInstance?.inicial}">
				<li class="fieldcontain">
					<span id="inicial-label" class="property-label"><g:message code="contrato.inicial.label" default="Inicial" /></span>

						<span class="property-value" aria-labelledby="inicial-label"><g:formatDate date="${contratoInstance?.inicial}" /></span>

				</li>
				</g:if>

				<g:if test="${contratoInstance?.termino}">
				<li class="fieldcontain">
					<span id="termino-label" class="property-label"><g:message code="contrato.termino.label" default="Termino" /></span>

						<span class="property-value" aria-labelledby="termino-label"><g:formatDate date="${contratoInstance?.termino}" /></span>

				</li>
				</g:if>

				<g:if test="${contratoInstance?.valido}">
				<li class="fieldcontain">
					<span id="valido-label" class="property-label"><g:message code="contrato.valido.label" default="Estado" /></span>

						<span class="property-value" aria-labelledby="valido-label"><g:formatBoolean boolean="${contratoInstance?.valido}" /></span>

				</li>
				</g:if>

			</ol>
            <g:form url="[resource:contratoInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:if test="${contratoInstance?.valido}">
                        <g:link class="edit" action="edit" resource="${contratoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>

		</div>
	</body>
</html>
