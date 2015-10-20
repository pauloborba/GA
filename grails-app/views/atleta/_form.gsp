<%@ page import="ga.Atleta" %>



<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="atleta.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${atletaInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="atleta.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${atletaInstance?.rg}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="atleta.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${atletaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="atleta.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${atletaInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="atleta.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" required="" value="${atletaInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'altura', 'error')} required">
	<label for="altura">
		<g:message code="atleta.altura.label" default="Altura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="altura" value="${fieldValue(bean: atletaInstance, field: 'altura')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'peso', 'error')} required">
	<label for="peso">
		<g:message code="atleta.peso.label" default="Peso" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="peso" value="${fieldValue(bean: atletaInstance, field: 'peso')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'posicao', 'error')} required">
	<label for="posicao">
		<g:message code="atleta.posicao.label" default="Posicao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="posicao" required="" value="${atletaInstance?.posicao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="atleta.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="categoria" required="" value="${atletaInstance?.categoria}"/>

</div>

<<<<<<< HEAD
<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'alojamentoClube', 'error')} ">
	<label for="alojamentoClube">
		<g:message code="atleta.alojamentoClube.label" default="Alojamento Clube" />
		
	</label>
	<g:checkBox name="alojamentoClube" value="${atletaInstance?.alojamentoClube}" />
=======
<div class="fieldcontain ${hasErrors(bean: atletaInstance, field: 'alojamento', 'error')} ">
	<label for="alojamento">
		<g:message code="atleta.alojamento.label" default="Alojamento" />
		
	</label>
	<g:checkBox name="alojamento" value="${atletaInstance?.alojamento}" />
>>>>>>> d926ac45d106c6b7f31effc90e68d37ac2a3f569

</div>

