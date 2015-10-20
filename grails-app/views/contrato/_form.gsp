<%@ page import="ga.Contrato" %>



<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'contratado', 'error')} required">
	<label for="contratado">
		<g:message code="contrato.contratado.label" default="Contratado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contratado" required="" value="${contratoInstance?.contratado}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'contratante', 'error')} required">
	<label for="contratante">
		<g:message code="contrato.contratante.label" default="Contratante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contratante" required="" value="${contratoInstance?.contratante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'data_inicio', 'error')} required">
	<label for="data_inicio">
		<g:message code="contrato.data_inicio.label" default="Datainicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="data_inicio" required="" value="${contratoInstance?.data_inicio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'data_termino', 'error')} required">
	<label for="data_termino">
		<g:message code="contrato.data_termino.label" default="Datatermino" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="data_termino" required="" value="${contratoInstance?.data_termino}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="contrato.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: contratoInstance, field: 'valor')}" required=""/>

</div>

