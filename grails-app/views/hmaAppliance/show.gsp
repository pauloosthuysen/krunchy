
<%@ page import="pho.homeautomation.HmaAppliance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hmaAppliance.label', default: 'HmaAppliance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hmaAppliance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="hma" href="${createLink(uri: '/hma')}"><g:message code="default.hma.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hmaAppliance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hmaAppliance">
			
				<g:if test="${hmaApplianceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="hmaAppliance.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${hmaApplianceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hmaApplianceInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="hmaAppliance.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${hmaApplianceInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hmaApplianceInstance?.applianceCategory}">
				<li class="fieldcontain">
					<span id="applianceCategory-label" class="property-label"><g:message code="hmaAppliance.applianceCategory.label" default="Appliance Category" /></span>
					
						<span class="property-value" aria-labelledby="applianceCategory-label"><g:link controller="hmaApplianceCategory" action="show" id="${hmaApplianceInstance?.applianceCategory?.id}">${hmaApplianceInstance?.applianceCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hmaApplianceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="hmaAppliance.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${hmaApplianceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hmaApplianceInstance?.id}" />
					<g:link class="edit" action="edit" id="${hmaApplianceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
