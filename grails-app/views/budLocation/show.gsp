
<%@ page import="pho.budget.BudLocation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budLocation.label', default: 'BudLocation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-budLocation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-budLocation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list budLocation">
			
				<g:if test="${budLocationInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="budLocation.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label">${country(code: fieldValue(bean: budLocationInstance, field: "country"))}</span>
					
				</li>
				</g:if>
			
				<g:if test="${budLocationInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="budLocation.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${budLocationInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budLocationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="budLocation.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${budLocationInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budLocationInstance?.suburb}">
				<li class="fieldcontain">
					<span id="suburb-label" class="property-label"><g:message code="budLocation.suburb.label" default="Suburb" /></span>
					
						<span class="property-value" aria-labelledby="suburb-label"><g:fieldValue bean="${budLocationInstance}" field="suburb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budLocationInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="budLocation.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${budLocationInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${budLocationInstance?.id}" />
					<g:link class="edit" action="edit" id="${budLocationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
