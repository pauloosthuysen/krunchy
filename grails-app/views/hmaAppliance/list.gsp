
<%@ page import="pho.homeautomation.HmaAppliance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hmaAppliance.label', default: 'HmaAppliance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">
            #logoutPanel{
                margin: 30px;
            }
        </style>
	</head>
	<body>
		<a href="#list-hmaAppliance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="hma" href="${createLink(uri: '/hma')}"><g:message code="default.hma.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hmaAppliance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'hmaAppliance.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'hmaAppliance.code.label', default: 'Code')}" />
					
						<th><g:message code="hmaAppliance.applianceCategory.label" default="Appliance Category" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'hmaAppliance.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hmaApplianceInstanceList}" status="i" var="hmaApplianceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hmaApplianceInstance.id}">${fieldValue(bean: hmaApplianceInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: hmaApplianceInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: hmaApplianceInstance, field: "applianceCategory")}</td>
					
						<td>${fieldValue(bean: hmaApplianceInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hmaApplianceInstanceTotal}" />
			</div>
		</div>
        <div id="logoutPanel">
            <g:render template="/logoutPanel"/>
        </div>
	</body>
</html>
