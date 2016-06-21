<%@ page import="ga.Atleta" %>



<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="atleta.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${atletaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="atleta.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${atletaInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'dataNascimento', 'error')} ">
	<label for="dataNascimento">
		<g:message code="atleta.dataNascimento.label" default="Data Nascimento" />
		
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${atletaInstance?.dataNascimento}" default="none" noSelection="['': '']" />

</div>

