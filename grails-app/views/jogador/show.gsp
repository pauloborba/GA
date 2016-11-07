
<%@ page import="ga.Jogador" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'jogador.label', default: 'Jogador')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-jogador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="show-jogador" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list jogador">

		<g:if test="${jogadorInstance?.nome}">
			<li class="fieldcontain">
				<span id="nome-label" class="property-label"><g:message code="jogador.nome.label" default="Nome" /></span>

				<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${jogadorInstance}" field="nome"/></span>

			</li>
		</g:if>

		<g:if test="${jogadorInstance?.cpf}">
			<li class="fieldcontain">
				<span id="cpf-label" class="property-label"><g:message code="jogador.cpf.label" default="Cpf" /></span>

				<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${jogadorInstance}" field="cpf"/></span>

			</li>
		</g:if>

		<g:if test="${jogadorInstance?.dataDeNascimento}">
			<li class="fieldcontain">
				<span id="dataDeNascimento-label" class="property-label"><g:message code="jogador.dataDeNascimento.label" default="Data De Nascimento" /></span>

				<span class="property-value" aria-labelledby="dataDeNascimento-label"><g:formatDate date="${jogadorInstance?.dataDeNascimento}" /></span>

			</li>
		</g:if>

		<g:if test="${jogadorInstance?.posicao}">
			<li class="fieldcontain">
				<span id="posicao-label" class="property-label"><g:message code="jogador.posicao.label" default="Posicao" /></span>

				<span class="property-value" aria-labelledby="posicao-label"><g:fieldValue bean="${jogadorInstance}" field="posicao"/></span>

			</li>
		</g:if>

		<g:if test="${jogadorInstance?.ativo}">
			<li class="fieldcontain">
				<span id="ativo-label" class="property-label"><g:message code="jogador.ativo.label" default="Ativo" /></span>

				<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${jogadorInstance?.ativo}" /></span>

			</li>
		</g:if>

		<g:if test="${jogadorInstance?.golsFeitos}">
			<li class="fieldcontain">
				<span id="golsFeitos-label" class="property-label"><g:message code="jogador.golsFeitos.label" default="Gols Feitos" /></span>

				<span class="property-value" aria-labelledby="golsFeitos-label"><g:fieldValue bean="${jogadorInstance}" field="golsFeitos"/></span>

			</li>
		</g:if>

	</ol>
	<g:if test="${jogadorInstance?.ativo}">
		<g:form url="[resource:jogadorInstance, action:'desative']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${jogadorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete" action="desative" value="${message(code: 'default.button.fakedelete.label', default: 'Desative')}" onclick="return confirm('${message(code: 'default.button.fakedelete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</g:if>
	<g:else>
		<g:form url="[resource:jogadorInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.realdelete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.realdelete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</g:else>

</div>
</body>
</html>
