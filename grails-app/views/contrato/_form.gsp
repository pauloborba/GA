<%@ page import="ga.Contrato" %>



<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="contrato.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${contratoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'jogador', 'error')} required">
	<label for="jogador">
		<g:message code="contrato.jogador.label" default="Jogador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="jogador" name="jogador.id" from="${ga.Jogador.list()}" optionKey="id" required="" value="${contratoInstance?.jogador?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'salario', 'error')} required">
	<label for="salario">
		<g:message code="contrato.salario.label" default="Salario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="salario" value="${fieldValue(bean: contratoInstance, field: 'salario')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'inicial', 'error')} ">
	<label for="inicial">
		<g:message code="contrato.inicial.label" default="Inicial" />

	</label>
	<g:datePicker name="inicial" precision="day"  value="${contratoInstance?.inicial}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'termino', 'error')} ">
	<label for="termino">
		<g:message code="contrato.termino.label" default="Termino" />

	</label>
	<g:datePicker name="termino" precision="day"  value="${contratoInstance?.termino}" default="none" noSelection="['': '']" />

</div>

<!-- <div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'valido', 'error')} ">
	<label for="valido">
		<g:message code="contrato.valido.label" default="Valido" />

	</label>
	<g:checkBox name="valido" value="${contratoInstance?.valido}" />

</div> -->
