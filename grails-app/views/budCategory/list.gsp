
<%@ page import="pho.budget.BudCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budCategory.label', default: 'BudCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">
            #logoutPanel{
                margin: 30px;
            }
        </style>
	</head>
	<body>
		<a href="#list-budCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="budget" href="${createLink(uri: '/bud')}"><g:message code="default.bud.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-budCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'budCategory.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'budCategory.description.label', default: 'Description')}" />
					
						<th><g:message code="budCategory.type.label" default="Type" /></th>
					
						<th><g:message code="budCategory.parent.label" default="Parent" /></th>

                        <th></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${budCategoryInstanceList}" status="i" var="budCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${budCategoryInstance.id}">${fieldValue(bean: budCategoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: budCategoryInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: budCategoryInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: budCategoryInstance, field: "parent")}</td>

                        <td><a href="${createLink(controller: "budTransaction",action: "showPerCategory")}?categoryId=${budCategoryInstance.id}">Transactions</a></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${budCategoryInstanceTotal}" />
			</div>
		</div>
        <div id="logoutPanel">
            <g:render template="/logoutPanel"/>
        </div>
	</body>
</html>
