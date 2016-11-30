<%@ page import="ga.Jogador" %>



<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="jogador.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${jogadorInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="jogador.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${jogadorInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'dataDeNascimento', 'error')} required">
	<label for="dataDeNascimento">
		<g:message code="jogador.dataDeNascimento.label" default="Data De Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataDeNascimento" precision="day"  value="${jogadorInstance?.dataDeNascimento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'posicao', 'error')} required">
	<label for="posicao">
		<g:message code="jogador.posicao.label" default="Posicao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="posicao" from="${jogadorInstance.constraints.posicao.inList}" required="" value="${jogadorInstance?.posicao}" valueMessagePrefix="jogador.posicao"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="jogador.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${jogadorInstance?.ativo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'contratos', 'error')} ">
	<label for="contratos">
		<g:message code="jogador.contratos.label" default="Contratos" />
		
	</label>
	<g:select name="contratos" from="${ga.Contrato.list()}" multiple="multiple" optionKey="id" size="5" value="${jogadorInstance?.contratos*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'golsFeitos', 'error')} required">
	<label for="golsFeitos">
		<g:message code="jogador.golsFeitos.label" default="Gols Feitos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="golsFeitos" type="number" value="${jogadorInstance.golsFeitos}" required=""/>

</div>

