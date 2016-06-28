<%--
  Created by IntelliJ IDEA.
  User: emanuel
  Date: 16/06/2016
  Time: 22:04
--%>

<%@ page import="ga.Atleta" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'atleta.label', default: 'Atleta')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<a href="#list-atleta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li><g:link action="overview"><g:message code="default.overview.label" default="Over" /></g:link></li>
    </ul>
</div>
<div id="list-atleta" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nome" title="${message(code: 'atleta.nome.label', default: 'Nome')}" />

            <g:sortableColumn property="cpf" title="${message(code: 'atleta.cpf.label', default: 'CPF')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${atletaInstanceList}" status="i" var="atletaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${atletaInstance.id}">${fieldValue(bean: atletaInstance, field: "nome")}</g:link></td>

                <td><g:formatBoolean boolean="${atletaInstance.cpf}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${atletaInstanceTotal}" />
    </div>
</div>
</body>
</html>