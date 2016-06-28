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
			<ol class="property-list atleta">
			
				<g:if test="${contratoInstance?.dataVencimento}">
				<li class="fieldcontain">
					<span id="dataVencimento-label" class="property-label"><g:message code="contrato.dataVencimento.label" default="Data Vencimento" /></span>
					
						<span class="property-value" aria-labelledby="dataVencimento-label"><g:formatDate date="${contratoInstance?.dataVencimento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoInstance?.atletaCpf}">
				<li class="fieldcontain">
					<span id="atletaCpf-label" class="property-label"><g:message code="contrato.atletaCpf.label" default="Atleta Cpf" /></span>
					
						<span class="property-value" aria-labelledby="atletaCpf-label"><g:fieldValue bean="${contratoInstance}" field="atletaCpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="contrato.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${contratoInstance}" field="numero"/></span>
					
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
