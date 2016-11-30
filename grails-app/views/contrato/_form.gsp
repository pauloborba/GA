<%@ page import="ga.Contrato" %>



<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'inicial', 'error')} required">
	<label for="inicial">
		<g:message code="contrato.inicial.label" default="Inicial" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicial" precision="day"  value="${contratoInstance?.inicial}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'salario', 'error')} required">
	<label for="salario">
		<g:message code="contrato.salario.label" default="Salario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="salario" value="${fieldValue(bean: contratoInstance, field: 'salario')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'termino', 'error')} required">
	<label for="termino">
		<g:message code="contrato.termino.label" default="Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="termino" precision="day"  value="${contratoInstance?.termino}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'valido', 'error')} ">
	<label for="valido">
		<g:message code="contrato.valido.label" default="Valido" />
		
	</label>
	<g:checkBox name="valido" value="${contratoInstance?.valido}" />

</div>

