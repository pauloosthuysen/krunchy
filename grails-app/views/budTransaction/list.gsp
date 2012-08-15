
<%@ page import="pho.budget.BudTransaction" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budTransaction.label', default: 'BudTransaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">
            #logoutPanel{
                margin: 30px;
            }
        </style>
	</head>
	<body>
		<a href="#list-budTransaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="budget" href="${createLink(uri: '/bud')}"><g:message code="default.bud.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-budTransaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'budTransaction.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'budTransaction.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'budTransaction.date.label', default: 'Date')}" />
					
						<th><g:message code="budTransaction.category.label" default="Category" /></th>
					
						<th><g:message code="budTransaction.location.label" default="Location" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${budTransactionInstanceList}" status="i" var="budTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${budTransactionInstance.id}">${fieldValue(bean: budTransactionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: budTransactionInstance, field: "amount")}</td>
					
						<td><g:formatDate date="${budTransactionInstance.date}" /></td>
					
						<td>${fieldValue(bean: budTransactionInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: budTransactionInstance, field: "location")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${budTransactionInstanceTotal}" />
			</div>
            <div id="logoutPanel">
                <g:render template="/logoutPanel"/>
            </div>
		</div>
	</body>
</html>
