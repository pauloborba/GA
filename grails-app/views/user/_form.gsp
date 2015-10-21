<%@ page import="ga.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${userInstance?.login}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="user.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="senha" required="" value="${userInstance?.senha}"/>

</div>

