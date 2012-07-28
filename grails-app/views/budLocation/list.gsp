
<%@ page import="pho.budget.BudLocation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budLocation.label', default: 'BudLocation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">
            #logoutPanel{
                margin: 30px;
            }
        </style>
	</head>
	<body>
		<a href="#list-budLocation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="budget" href="${createLink(uri: '/bud')}"><g:message code="default.bud.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-budLocation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="country" title="${message(code: 'budLocation.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'budLocation.state.label', default: 'State')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'budLocation.city.label', default: 'City')}" />
					
						<g:sortableColumn property="suburb" title="${message(code: 'budLocation.suburb.label', default: 'Suburb')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'budLocation.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${budLocationInstanceList}" status="i" var="budLocationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${budLocationInstance.id}">${country(code: fieldValue(bean: budLocationInstance, field: "country"))}</g:link></td>
					
						<td>${fieldValue(bean: budLocationInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: budLocationInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: budLocationInstance, field: "suburb")}</td>
					
						<td>${fieldValue(bean: budLocationInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${budLocationInstanceTotal}" />
			</div>
		</div>
        <div id="logoutPanel">
            <g:render template="/logoutPanel"/>
        </div>
	</body>
</html>
