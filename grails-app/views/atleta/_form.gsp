<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="atleta.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${atletaInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="atleta.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${atletaInstance?.nome}"/>

</div>
