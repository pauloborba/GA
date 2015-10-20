
<%@ page import="ga.Atleta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atleta.label', default: 'Atleta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-atleta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-atleta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list atleta">
			
				<g:if test="${atletaInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="atleta.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${atletaInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="atleta.rg.label" default="Rg" /></span>
					
						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${atletaInstance}" field="rg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="atleta.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${atletaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="atleta.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${atletaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.telefone}">
				<li class="fieldcontain">
					<span id="telefone-label" class="property-label"><g:message code="atleta.telefone.label" default="Telefone" /></span>
					
						<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${atletaInstance}" field="telefone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.altura}">
				<li class="fieldcontain">
					<span id="altura-label" class="property-label"><g:message code="atleta.altura.label" default="Altura" /></span>
					
						<span class="property-value" aria-labelledby="altura-label"><g:fieldValue bean="${atletaInstance}" field="altura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.peso}">
				<li class="fieldcontain">
					<span id="peso-label" class="property-label"><g:message code="atleta.peso.label" default="Peso" /></span>
					
						<span class="property-value" aria-labelledby="peso-label"><g:fieldValue bean="${atletaInstance}" field="peso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.posicao}">
				<li class="fieldcontain">
					<span id="posicao-label" class="property-label"><g:message code="atleta.posicao.label" default="Posicao" /></span>
					
						<span class="property-value" aria-labelledby="posicao-label"><g:fieldValue bean="${atletaInstance}" field="posicao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${atletaInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="atleta.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${atletaInstance}" field="categoria"/></span>
					
				</li>
				</g:if>
			
<<<<<<< HEAD
				<g:if test="${atletaInstance?.alojamentoClube}">
				<li class="fieldcontain">
					<span id="alojamentoClube-label" class="property-label"><g:message code="atleta.alojamentoClube.label" default="Alojamento Clube" /></span>
					
						<span class="property-value" aria-labelledby="alojamentoClube-label"><g:formatBoolean boolean="${atletaInstance?.alojamentoClube}" /></span>
=======
				<g:if test="${atletaInstance?.alojamento}">
				<li class="fieldcontain">
					<span id="alojamento-label" class="property-label"><g:message code="atleta.alojamento.label" default="Alojamento" /></span>
					
						<span class="property-value" aria-labelledby="alojamento-label"><g:formatBoolean boolean="${atletaInstance?.alojamento}" /></span>
>>>>>>> d926ac45d106c6b7f31effc90e68d37ac2a3f569
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:atletaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${atletaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
