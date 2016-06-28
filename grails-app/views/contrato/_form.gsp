<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'atletaCpf', 'error')} required">
	<label for="atletaCpf">
		<g:message code="contrato.atletaCpf.label" default="Atleta CPF" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="atletaCpf" required="" value="${contratoInstance?.atletaCpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'numero', 'error')} required">
	<label for="nome">
		<g:message code="contrato.numero.label" default="Número" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" required="" value="${contratoInstance?.numero}"/>

</div>
