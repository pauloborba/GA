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

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'dataDeNascimento', 'error')} ">
	<label for="dataDeNascimento">
		<g:message code="jogador.dataDeNascimento.label" default="Data De Nascimento" />

	</label>
	<g:datePicker name="dataDeNascimento" precision="day"  value="${jogadorInstance?.dataDeNascimento}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'posicao', 'error')} ">
	<label for="posicao">
		<g:message code="jogador.posicao.label" default="Posicao" />

	</label>
	<g:select name="posicao" from="${jogadorInstance.constraints.posicao.inList}" value="${jogadorInstance?.posicao}" valueMessagePrefix="jogador.posicao" noSelection="['': '']"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'ativo', 'error')} ">--}%
%{--<label for="ativo">--}%
%{--<g:message code="jogador.ativo.label" default="Ativo" />--}%
%{----}%
%{--</label>--}%
%{--<g:checkBox name="ativo" value="${jogadorInstance?.ativo}" />--}%

%{--</div>--}%


<div class="fieldcontain ${hasErrors(bean: jogadorInstance, field: 'golsFeitos', 'error')} required">
	<label for="golsFeitos">
		<g:message code="jogador.golsFeitos.label" default="Gols Feitos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="golsFeitos" type="number" value="${jogadorInstance.golsFeitos}" required=""/>

</div>

