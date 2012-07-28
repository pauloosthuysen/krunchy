
<%@ page import="pho.budget.BudTransaction" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budTransaction.label', default: 'BudTransaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-budTransaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="budget" href="${createLink(uri: '/bud')}"><g:message code="default.bud.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-budTransaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list budTransaction">
			
				<g:if test="${budTransactionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="budTransaction.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${budTransactionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budTransactionInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="budTransaction.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${budTransactionInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budTransactionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="budTransaction.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${budTransactionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${budTransactionInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="budTransaction.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="budCategory" action="show" id="${budTransactionInstance?.category?.id}">${budTransactionInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${budTransactionInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="budTransaction.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="budLocation" action="show" id="${budTransactionInstance?.location?.id}">${budTransactionInstance?.location?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${budTransactionInstance?.id}" />
					<g:link class="edit" action="edit" id="${budTransactionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
