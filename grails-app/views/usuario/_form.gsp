<%@ page import="ga.Usuario" %>



<div class=" form-group ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} required">
	<label class="control-label col-md-2" for="nome">
		<g:message code="usuario.nome.label" default="Nome" />
		<span class="">*</span>
	</label>
	<div class="col-md-10">
		<g:textField class="form-control" placeholder="${message(code:"usuario.nome.label",default:"Nome")}" name="nome" required="" value="${usuarioInstance?.nome}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label class="control-label col-md-2" for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-10">
		<g:field class="form-control" placeholder="${message(code:"usuario.email.label",default:"Email")}" type="email" name="email" required="" value="${usuarioInstance?.email}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'clausula_gols', 'error')}">
	<div class="col-md-offset-2 col-md-10">
		<div class="checkbox">
			<label><g:checkBox name="clausula_gols" value="${usuarioInstance?.clausula_gols}" /> <g:message code="usuario.clausula_gols.label" default="Clausula de Quantidade de gols" /></label>
		</div>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'contrato_expira', 'error')}">
	<div class="col-md-offset-2 col-md-10">
		<div class="checkbox">
			<label><g:checkBox name="contrato_expira" value="${usuarioInstance?.contrato_expira}" /> <g:message code="usuario.contrato_expira.label" default="Contrato perto de acabar" /></label>
		</div>
	</div>
</div>

